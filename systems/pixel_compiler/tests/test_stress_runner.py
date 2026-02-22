"""Tests for stress test runner."""
import pytest
from unittest.mock import AsyncMock, patch

from systems.pixel_compiler.a2a_load_test.stress_scenarios import StressScenario, FailureMode
from systems.pixel_compiler.a2a_load_test.load_harness import LoadTestHarness


class TestStressRunner:
    """Tests for stress test execution."""

    @pytest.fixture
    def mock_websockets(self):
        """Mock websockets.connect."""
        mock_ws = AsyncMock()
        mock_ws.send = AsyncMock()
        mock_ws.recv = AsyncMock(return_value='{"type": "ack"}')
        mock_ws.close = AsyncMock()
        with patch('websockets.connect', new_callable=AsyncMock, return_value=mock_ws) as mock:
            yield mock, mock_ws

    @pytest.mark.asyncio
    async def test_run_stress_scenario(self, mock_websockets):
        """Can run a stress scenario."""
        mock_connect, mock_ws = mock_websockets

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=10
        )

        scenario = StressScenario(
            name="test_stress",
            agent_count=10,
            duration_sec=2,  # Short for test
            message_rate_per_sec=5
        )

        await harness.setup()
        result = await harness.run_stress_scenario(scenario)
        await harness.teardown()

        assert result["scenario"] == "test_stress"
        assert result["success"] is True
        assert "resource_stats" in result

    @pytest.mark.asyncio
    async def test_stress_with_failure_injection(self, mock_websockets):
        """Can inject failures during stress test."""
        mock_connect, mock_ws = mock_websockets

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=5
        )

        scenario = StressScenario(
            name="failure_test",
            agent_count=5,
            duration_sec=2,
            failure_mode=FailureMode.MESSAGE_DROP,
            failure_rate=0.5  # 50% drop rate
        )

        await harness.setup()
        result = await harness.run_stress_scenario(scenario)
        await harness.teardown()

        # Should complete even with failures
        assert result["success"] is True
        assert result["messages_dropped"] >= 0
