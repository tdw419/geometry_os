"""Tests for EvolutionJournal service."""

import pytest
from systems.evolution_daemon.evolution_journal import (
    EvolutionEvent,
    EventType,
    JournalStats
)


class TestEvolutionEvent:
    """Tests for EvolutionEvent dataclass."""

    def test_event_creation_with_required_fields(self):
        """Should create event with required fields."""
        event = EvolutionEvent(
            event_type=EventType.PROPOSAL_CREATED,
            proposal_id="prop-001",
            title="Test Proposal"
        )
        assert event.event_type == EventType.PROPOSAL_CREATED
        assert event.proposal_id == "prop-001"
        assert event.title == "Test Proposal"

    def test_event_has_auto_timestamp(self):
        """Should auto-generate timestamp."""
        event = EvolutionEvent(
            event_type=EventType.PROPOSAL_CREATED,
            proposal_id="prop-001",
            title="Test"
        )
        assert event.timestamp is not None
        assert len(event.timestamp) > 0

    def test_event_to_dict_serializes_correctly(self):
        """Should serialize to dict for JSON."""
        event = EvolutionEvent(
            event_type=EventType.GUARDIAN_APPROVED,
            proposal_id="prop-002",
            title="Approved",
            risk_level="low",
            confidence=0.95
        )
        result = event.to_dict()
        assert result["event_type"] == "guardian_approved"
        assert result["proposal_id"] == "prop-002"
        assert result["risk_level"] == "low"
        assert result["confidence"] == 0.95


class TestEventType:
    """Tests for EventType enum."""

    def test_event_type_values(self):
        """Should have correct string values."""
        assert EventType.PROPOSAL_CREATED.value == "proposal_created"
        assert EventType.GUARDIAN_APPROVED.value == "guardian_approved"
        assert EventType.COMMIT_MADE.value == "commit_made"

    def test_event_type_count(self):
        """Should have exactly 3 core event types."""
        assert len(EventType) == 3


class TestJournalStats:
    """Tests for JournalStats dataclass."""

    def test_stats_initial_values(self):
        """Should start with zero counts."""
        stats = JournalStats()
        assert stats.events_published == 0
        assert stats.events_failed == 0
        assert stats.last_publish_time is None

    def test_stats_success_rate_zero_events(self):
        """Should return 1.0 when no events."""
        stats = JournalStats()
        assert stats.success_rate == 1.0

    def test_stats_success_rate_with_events(self):
        """Should calculate correct success rate."""
        stats = JournalStats(events_published=8, events_failed=2)
        assert stats.success_rate == 0.8
