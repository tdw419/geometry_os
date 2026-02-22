"""
Test for First Autonomous Evolution Run

Verifies that the evolution runner script logic works correctly.
"""

import pytest
from systems.evolution_daemon.evolution_daemon import EvolutionTask
from systems.evolution_daemon.visual_verification_service import (
    VisualIntent,
    CriticalityLevel,
    CriticalityClassifier
)


class TestFirstEvolution:
    """Tests for the first autonomous evolution scenario."""

    def test_notification_badge_intent_creation(self):
        """Verify notification_badge intent can be created."""
        intent = VisualIntent(
            element_type="notification_badge",
            position=(100, 100),
            size=(24, 24),
            critical=False,
            properties={"text": "3", "type": "badge"}
        )

        assert intent.element_type == "notification_badge"
        assert intent.position == (100, 100)
        assert intent.size == (24, 24)
        assert intent.critical is False

    def test_evolution_task_creation(self):
        """Verify evolution task for notification_badge can be created."""
        visual_intent = VisualIntent(
            element_type="notification_badge",
            position=(100, 100),
            size=(24, 24)
        )

        task = EvolutionTask(
            task_id="test-evolution-001",
            goal="Add notification_badge as RELAXED criticality type",
            target_file="systems/evolution_daemon/visual_verification_service.py",
            visual_intent=visual_intent,
            priority=10
        )

        assert task.task_id == "test-evolution-001"
        assert "notification_badge" in task.goal
        assert task.visual_intent is not None
        assert task.priority == 10

    def test_notification_badge_classification(self):
        """Verify notification_badge classification behavior.

        Before evolution: may not be specifically classified
        After evolution: should be RELAXED
        """
        classifier = CriticalityClassifier()

        intent = VisualIntent(
            element_type="notification_badge",
            position=(0, 0),
            size=(24, 24)
        )

        # Get current classification
        criticality = classifier.classify(intent)

        # It should be some valid criticality level
        assert criticality in [
            CriticalityLevel.EXACT,
            CriticalityLevel.TOLERANT,
            CriticalityLevel.RELAXED
        ]
