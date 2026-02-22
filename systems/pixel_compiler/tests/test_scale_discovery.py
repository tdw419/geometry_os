# systems/pixel_compiler/tests/test_scale_discovery.py
"""Tests for scale limit discovery module."""
import pytest
from systems.pixel_compiler.a2a_load_test.scale_discovery import (
    ScaleDiscovery,
    ScaleLimit,
    LimitType
)


class TestScaleLimit:
    """Tests for scale limit dataclass."""

    def test_scale_limit_creation(self):
        """Can create a scale limit."""
        limit = ScaleLimit(
            limit_type=LimitType.AGENT_COUNT,
            value=500,
            metric="success_rate",
            threshold=0.95
        )

        assert limit.limit_type == LimitType.AGENT_COUNT
        assert limit.value == 500
        assert limit.threshold == 0.95


class TestLimitType:
    """Tests for limit type enum."""

    def test_limit_types_exist(self):
        """All limit types are defined."""
        assert LimitType.AGENT_COUNT.value == "agent_count"
        assert LimitType.MESSAGE_RATE.value == "message_rate"
        assert LimitType.CONCURRENT_MESSAGES.value == "concurrent_messages"
        assert LimitType.MEMORY_MB.value == "memory_mb"


class TestScaleDiscovery:
    """Tests for scale limit discovery."""

    @pytest.mark.asyncio
    async def test_discovery_binary_search(self):
        """Discovery uses binary search to find limits."""
        discovery = ScaleDiscovery(
            router_url="ws://localhost:8766",
            target_success_rate=0.95
        )

        # Mock the test function to simulate limits
        async def mock_test(agents):
            # Fail above 100 agents
            return agents <= 100

        discovery._test_agent_count = mock_test

        result = await discovery.find_agent_limit(
            min_agents=10,
            max_agents=200
        )

        # Should find limit near 100
        assert result.value >= 90
        assert result.value <= 110

    @pytest.mark.asyncio
    async def test_discovery_default_test(self):
        """Default test always passes."""
        discovery = ScaleDiscovery(router_url="ws://localhost:8766")

        result = await discovery.find_agent_limit(min_agents=10, max_agents=50)

        # With default test (always passes), should return max
        assert result.value == 50
