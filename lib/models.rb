require_relative 'models/base'
require_relative 'models/panoptes_classification'
require_relative 'models/panoptes_workflow_counter'
require_relative 'models/talk_comment'
require_relative 'models/ouroboros_classification'
require_relative 'models/ouroboros_comment'

module Models
  REGISTRY = {
    "panoptes" => {
      "classification" => Models::PanoptesClassification,
      "workflow_counter" => Models::PanoptesWorkflowCounter
    },
    "talk" => {
      "comment" => Models::TalkComment
    },
    "ouroboros" => {
      "classification" => Models::OuroborosClassification,
      "comment" => Models::OuroborosComment
    }
  }

  def self.for(event)
    source = event.fetch("source")
    type   = event.fetch("type")

    REGISTRY.fetch(source, {}).fetch(type, nil).new(event)
  end
end
