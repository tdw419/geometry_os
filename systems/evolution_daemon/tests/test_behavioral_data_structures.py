"""
Evolution Daemon - Behavioral Data Structures Tests

Tests for AgentBehavioralProfile and BehavioralEvent dataclasses
used in behavioral defense and anomaly detection.
"""
import pytest
from datetime import datetime
from dataclasses import fields

from systems.evolution_daemon.safety.data_structures import (
    AgentBehavioralProfile,
    BehavioralEvent
)


class TestAgentBehavioralProfile:
    """Tests for AgentBehavioralProfile dataclass."""

    def test_profile_creation_with_required_fields(self):
        """Test profile creation with only agent_id."""
        profile = AgentBehavioralProfile(agent_id="agent-001")
        assert profile.agent_id == "agent-001"
        assert profile.file_ops_count == 0
        assert profile.network_ops_count == 0
        assert profile.entropy_score == 0.0

    def test_profile_field_defaults(self):
        """Test that all fields have appropriate defaults."""
        profile = AgentBehavioralProfile(agent_id="test-agent")

        # Counter defaults
        assert profile.file_ops_count == 0
        assert profile.network_ops_count == 0

        # Entropy defaults to 0
        assert profile.entropy_score == 0.0

        # Timestamps should be auto-generated
        assert profile.last_activity is not None
        assert profile.sliding_window_start is not None

    def test_profile_with_custom_values(self):
        """Test profile creation with custom values."""
        profile = AgentBehavioralProfile(
            agent_id="suspicious-agent",
            file_ops_count=100,
            network_ops_count=50,
            entropy_score=0.85
        )
        assert profile.agent_id == "suspicious-agent"
        assert profile.file_ops_count == 100
        assert profile.network_ops_count == 50
        assert profile.entropy_score == 0.85

    def test_is_anomalous_below_threshold(self):
        """Test is_anomalous returns False for low entropy."""
        profile = AgentBehavioralProfile(
            agent_id="normal-agent",
            entropy_score=0.3
        )
        assert profile.is_anomalous() is False

    def test_is_anomalous_at_threshold(self):
        """Test is_anomalous returns False at exactly 0.7 (not > 0.7)."""
        profile = AgentBehavioralProfile(
            agent_id="threshold-agent",
            entropy_score=0.7
        )
        assert profile.is_anomalous() is False

    def test_is_anomalous_above_threshold(self):
        """Test is_anomalous returns True for entropy > 0.7."""
        profile = AgentBehavioralProfile(
            agent_id="suspicious-agent",
            entropy_score=0.8
        )
        assert profile.is_anomalous() is True

    def test_is_anomalous_at_max_entropy(self):
        """Test is_anomalous returns True at max entropy (1.0)."""
        profile = AgentBehavioralProfile(
            agent_id="high-entropy-agent",
            entropy_score=1.0
        )
        assert profile.is_anomalous() is True


class TestBehavioralEvent:
    """Tests for BehavioralEvent dataclass."""

    def test_event_creation_with_required_fields(self):
        """Test event creation with required fields."""
        event = BehavioralEvent(
            event_id="evt-001",
            agent_id="agent-001",
            event_type="file_read"
        )
        assert event.event_id == "evt-001"
        assert event.agent_id == "agent-001"
        assert event.event_type == "file_read"

    def test_event_auto_generated_fields(self):
        """Test that timestamp and entropy are auto-generated."""
        event = BehavioralEvent(
            event_id="evt-002",
            agent_id="agent-001",
            event_type="file_write"
        )
        # Timestamp should be auto-generated (not empty)
        assert event.timestamp is not None
        assert len(event.timestamp) > 0

        # Entropy defaults to 0.0
        assert event.entropy == 0.0

        # Metadata defaults to empty dict
        assert event.metadata == {}

    def test_event_with_metadata(self):
        """Test event creation with metadata."""
        event = BehavioralEvent(
            event_id="evt-003",
            agent_id="agent-001",
            event_type="network_request",
            metadata={"url": "https://example.com", "method": "GET"}
        )
        assert event.metadata["url"] == "https://example.com"
        assert event.metadata["method"] == "GET"

    def test_calculate_entropy_empty_metadata(self):
        """Test calculate_entropy returns 0 for empty metadata."""
        event = BehavioralEvent(
            event_id="evt-004",
            agent_id="agent-001",
            event_type="file_read",
            metadata={}
        )
        entropy = event.calculate_entropy()
        assert entropy == 0.0
        assert event.entropy == 0.0

    def test_calculate_entropy_uniform_metadata(self):
        """Test calculate_entropy with uniform (low entropy) metadata."""
        # Same value repeated = low entropy
        event = BehavioralEvent(
            event_id="evt-005",
            agent_id="agent-001",
            event_type="file_read",
            metadata={"path": "/home/user/file.txt"}  # Simple, uniform data
        )
        entropy = event.calculate_entropy()
        # Uniform data should have relatively low entropy
        assert 0.0 <= entropy <= 1.0

    def test_calculate_entropy_varied_metadata(self):
        """Test calculate_entropy with varied (higher entropy) metadata."""
        # More varied values = higher entropy
        event = BehavioralEvent(
            event_id="evt-006",
            agent_id="agent-001",
            event_type="file_read",
            metadata={
                "path": "/etc/passwd",
                "user": "admin",
                "action": "read",
                "timestamp": "2026-02-22T12:00:00Z",
                "session": "abc123xyz789"
            }
        )
        entropy = event.calculate_entropy()
        # Varied data should produce some entropy
        assert 0.0 <= entropy <= 1.0
        # The entropy field should be updated
        assert event.entropy == entropy

    def test_calculate_entropy_returns_normalized_value(self):
        """Test that calculate_entropy always returns normalized value."""
        event = BehavioralEvent(
            event_id="evt-007",
            agent_id="agent-001",
            event_type="shell_exec",
            metadata={"cmd": "ls -la /home/user/Documents/projects"}
        )
        entropy = event.calculate_entropy()
        # Entropy should always be in range [0.0, 1.0]
        assert entropy >= 0.0
        assert entropy <= 1.0


class TestBehavioralEventEdgeCases:
    """Edge case tests for BehavioralEvent."""

    def test_event_with_nested_metadata(self):
        """Test event with nested metadata structures."""
        event = BehavioralEvent(
            event_id="evt-008",
            agent_id="agent-001",
            event_type="api_call",
            metadata={
                "request": {
                    "endpoint": "/api/v1/users",
                    "method": "POST"
                },
                "response": {
                    "status": 200,
                    "time_ms": 150
                }
            }
        )
        entropy = event.calculate_entropy()
        assert 0.0 <= entropy <= 1.0

    def test_event_with_special_characters_in_metadata(self):
        """Test event with special characters in metadata."""
        event = BehavioralEvent(
            event_id="evt-009",
            agent_id="agent-001",
            event_type="file_write",
            metadata={
                "content": "Hello\nWorld\t!@#$%^&*()",
                "path": "/tmp/test file (1).txt"
            }
        )
        entropy = event.calculate_entropy()
        assert 0.0 <= entropy <= 1.0

    def test_profile_entropy_boundary_values(self):
        """Test profile with entropy at exact boundary values."""
        # Test at 0.0
        profile_zero = AgentBehavioralProfile(agent_id="zero", entropy_score=0.0)
        assert profile_zero.is_anomalous() is False

        # Test at 1.0
        profile_one = AgentBehavioralProfile(agent_id="one", entropy_score=1.0)
        assert profile_one.is_anomalous() is True

        # Test just below threshold
        profile_below = AgentBehavioralProfile(agent_id="below", entropy_score=0.699999)
        assert profile_below.is_anomalous() is False

        # Test just above threshold
        profile_above = AgentBehavioralProfile(agent_id="above", entropy_score=0.700001)
        assert profile_above.is_anomalous() is True
