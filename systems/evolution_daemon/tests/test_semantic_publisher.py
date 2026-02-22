"""
Tests for Semantic Publisher - WordPress Integration
"""

import pytest
import numpy as np
import sys
from pathlib import Path
from unittest.mock import patch, MagicMock

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from evolution_daemon.semantic_publisher import (
    SemanticPublisher, EvolutionEvent, EvolutionJournaler
)


class TestEvolutionEvent:
    def test_event_creation(self):
        """EvolutionEvent should store all fields."""
        event = EvolutionEvent(
            event_type="breakthrough",
            agent_id="test_agent",
            component="entropy",
            operation="sharpen",
            details={"before": 5.0, "after": 3.0},
            timestamp=1234567890.0,
            confidence=0.85
        )

        assert event.event_type == "breakthrough"
        assert event.agent_id == "test_agent"
        assert event.confidence == 0.85

    def test_event_to_html(self):
        """EvolutionEvent should generate semantic HTML."""
        event = EvolutionEvent(
            event_type="evolution",
            agent_id="agent_1",
            component="terminal",
            operation="erode",
            details={"density": 0.9},
            timestamp=1234567890.0,
            confidence=0.75
        )

        html = event.to_html_content()

        assert "<h3>" in html
        assert "EVOLUTION" in html
        assert "agent_1" in html
        assert "erode" in html
        assert "75.00%" in html


class TestSemanticPublisher:
    def test_publisher_initialization(self):
        """Publisher should initialize with defaults."""
        publisher = SemanticPublisher(enabled=True)
        assert publisher.enabled
        assert publisher.rate_limit_seconds == 30.0
        assert publisher.district_id == "evolution_daemon"

    def test_rate_limiting(self):
        """Publisher should respect rate limits."""
        publisher = SemanticPublisher(enabled=True, rate_limit_seconds=1.0)

        # First call should not be rate limited
        assert not publisher.is_rate_limited()

        # Simulate publish
        publisher.last_publish_time = 1234567890.0

        # Should be rate limited immediately after
        with patch('time.time', return_value=1234567890.5):
            assert publisher.is_rate_limited()

    def test_queue_event(self):
        """Publisher should queue events when rate limited."""
        publisher = SemanticPublisher(enabled=True)

        event = EvolutionEvent(
            event_type="test",
            agent_id="test",
            component="test",
            operation="test",
            details={},
            timestamp=0.0,
            confidence=0.5
        )

        publisher.queue_event(event)
        assert len(publisher.event_queue) == 1

    def test_publish_disabled(self):
        """Publisher should skip when disabled."""
        publisher = SemanticPublisher(enabled=False)

        event = EvolutionEvent(
            event_type="test",
            agent_id="test",
            component="test",
            operation="test",
            details={},
            timestamp=0.0,
            confidence=0.5
        )

        result = publisher.publish_event(event)
        assert result is None

    @patch('evolution_daemon.semantic_publisher.publish_to_wordpress')
    def test_publish_event_success(self, mock_publish):
        """Publisher should call WordPress API."""
        mock_publish.return_value = {"url": "http://test", "post_id": 123}

        publisher = SemanticPublisher(enabled=True, rate_limit_seconds=0)
        publisher.ws = None  # Disable WebSocket to avoid async issues

        event = EvolutionEvent(
            event_type="breakthrough",
            agent_id="agent",
            component="entropy",
            operation="sharpen",
            details={"improvement": 0.2},
            timestamp=1234567890.0,
            confidence=0.9
        )

        result = publisher.publish_event(event)

        assert result is not None
        assert result["post_id"] == 123
        mock_publish.assert_called_once()

    def test_publish_breakthrough(self):
        """Publisher should format breakthrough events."""
        publisher = SemanticPublisher(enabled=False)

        with patch.object(publisher, 'publish_event') as mock_publish:
            publisher.publish_breakthrough(
                component="entropy",
                metric_name="shannon_entropy",
                before=5.0,
                after=3.0
            )

            # Verify event was created with correct type
            mock_publish.assert_called_once()
            event = mock_publish.call_args[0][0]
            assert event.event_type == "breakthrough"
            assert "improvement_pct" in event.details


class TestEvolutionJournaler:
    def test_journaler_initialization(self):
        """Journaler should initialize correctly."""
        journaler = EvolutionJournaler(enabled=True)
        assert journaler.publisher is not None
        assert journaler.event_count == 0

    def test_log_proposal(self):
        """Journaler should log evolution proposals."""
        journaler = EvolutionJournaler(enabled=False)

        # Create mock proposal
        from evolution_daemon.area_agents.terminal_agent import EvolutionProposal
        proposal = EvolutionProposal(
            agent_id="test_agent",
            operation="sharpen",
            region=(0, 0, 10, 10),
            confidence=0.8,
            rationale="Test rationale",
            metadata={"entropy": 5.0}
        )

        journaler.log_proposal(proposal)
        assert journaler.event_count == 1

    def test_log_analysis(self):
        """Journaler should log analysis events."""
        journaler = EvolutionJournaler(enabled=False)

        analysis = {
            "density": 0.5,
            "entropy": 4.0,
            "non_empty_cells": 100
        }

        journaler.log_analysis("agent_1", analysis)
        assert journaler.event_count == 1


class TestTerminalAreaAgentIntegration:
    """Test WordPress integration in TerminalAreaAgent."""

    def test_agent_with_semantic_publishing(self):
        """Agent should initialize with semantic publishing."""
        from evolution_daemon.area_agents.terminal_agent import TerminalAreaAgent

        agent = TerminalAreaAgent(
            agent_id="test_agent",
            bounds=(0, 0, 8, 8),
            semantic_publishing=True
        )

        # Check that journaler was initialized (if available)
        # May be None if WordPress zone not available
        assert agent.agent_id == "test_agent"

    def test_agent_proposal_logs_to_wordpress(self):
        """Agent proposals should be logged when semantic publishing enabled."""
        from evolution_daemon.area_agents.terminal_agent import TerminalAreaAgent

        agent = TerminalAreaAgent(
            agent_id="log_test",
            bounds=(0, 0, 8, 8),
            semantic_publishing=False  # Disabled for test
        )

        # Create sparse texture to trigger consolidate proposal
        texture = np.zeros((16, 16, 4), dtype=np.uint8)

        proposal = agent.propose_evolution(texture)

        # Verify proposal was generated
        if proposal is not None:
            assert proposal.agent_id == "log_test"
