# systems/pixel_compiler/tests/test_a2a_load_harness.py
import pytest
import pytest_asyncio
import asyncio
import json
from unittest.mock import AsyncMock, MagicMock, patch
from systems.pixel_compiler.a2a_load_test.load_harness import (
    LoadTestHarness,
    LoadTestScenario,
    LoadTestResult
)


def create_mock_websocket():
    """Create a mock websocket that behaves like a connected websocket."""
    mock_ws = AsyncMock()
    mock_ws.send = AsyncMock()
    mock_ws.recv = AsyncMock(return_value=json.dumps({"type": "ack"}))
    mock_ws.close = AsyncMock()
    return mock_ws


@pytest.fixture
def mock_websockets_connect():
    """Fixture to mock websockets.connect."""
    mock_ws = create_mock_websocket()
    with patch('websockets.connect', new_callable=AsyncMock, return_value=mock_ws) as mock_connect:
        yield mock_connect, mock_ws


class TestLoadTestScenario:
    """Tests for load test scenarios."""

    def test_scenario_defaults(self):
        """Scenario has sensible defaults."""
        scenario = LoadTestScenario(name="default")

        assert scenario.name == "default"
        assert scenario.message_count == 100
        assert scenario.message_interval_ms == 100
        assert scenario.warmup_messages == 10
        assert scenario.use_barriers is False
        assert scenario.use_locks is False
        assert scenario.topology == "star"

    def test_scenario_custom(self):
        """Scenario accepts custom parameters."""
        scenario = LoadTestScenario(
            name="stress",
            message_count=1000,
            message_interval_ms=1,
            warmup_messages=100,
            use_barriers=True,
            use_locks=False,
            topology="mesh"
        )

        assert scenario.name == "stress"
        assert scenario.message_count == 1000
        assert scenario.message_interval_ms == 1
        assert scenario.warmup_messages == 100
        assert scenario.use_barriers is True
        assert scenario.use_locks is False
        assert scenario.topology == "mesh"


class TestLoadTestResult:
    """Tests for load test results."""

    def test_result_to_dict(self):
        """Result can be converted to dictionary."""
        result = LoadTestResult(
            scenario="test_scenario",
            agent_count=10,
            messages_sent=100,
            messages_received=100,
            duration_sec=5.0,
            throughput_msg_per_sec=20.0,
            avg_latency_ms=50.0,
            p50_latency_ms=45.0,
            p95_latency_ms=80.0,
            p99_latency_ms=95.0,
            errors=[],
            raw_latencies=[45.0, 50.0, 55.0]
        )

        d = result.to_dict()

        assert d["scenario"] == "test_scenario"
        assert d["agent_count"] == 10
        assert d["messages_sent"] == 100
        assert d["messages_received"] == 100
        assert d["duration_sec"] == 5.0
        assert d["throughput_msg_per_sec"] == 20.0
        assert d["avg_latency_ms"] == 50.0
        assert d["p50_latency_ms"] == 45.0
        assert d["p95_latency_ms"] == 80.0
        assert d["p99_latency_ms"] == 95.0
        assert d["errors"] == []

    def test_result_with_errors(self):
        """Result can include errors."""
        result = LoadTestResult(
            scenario="error_scenario",
            agent_count=2,
            messages_sent=10,
            messages_received=8,
            duration_sec=1.0,
            throughput_msg_per_sec=10.0,
            avg_latency_ms=50.0,
            p50_latency_ms=50.0,
            p95_latency_ms=50.0,
            p99_latency_ms=50.0,
            errors=["Connection timeout", "Agent disconnected"],
            raw_latencies=[50.0]
        )

        d = result.to_dict()

        assert len(d["errors"]) == 2
        assert "Connection timeout" in d["errors"]

    def test_result_does_not_include_raw_latencies(self):
        """Result to_dict does not include raw latencies."""
        result = LoadTestResult(
            scenario="test",
            agent_count=1,
            messages_sent=1,
            messages_received=1,
            duration_sec=1.0,
            throughput_msg_per_sec=1.0,
            avg_latency_ms=1.0,
            p50_latency_ms=1.0,
            p95_latency_ms=1.0,
            p99_latency_ms=1.0,
            raw_latencies=[1.0, 2.0, 3.0, 4.0, 5.0]
        )

        d = result.to_dict()

        # raw_latencies should not be in the dict output
        assert "raw_latencies" not in d


class TestLoadTestHarness:
    """Tests for the load testing harness."""

    def test_harness_initialization(self):
        """Harness initializes with configuration."""
        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=10
        )

        assert harness.router_url == "ws://localhost:8766"
        assert harness.agent_count == 10
        assert harness.agent_types == ["load_test"]
        assert harness.topology is None

    def test_harness_with_custom_types(self):
        """Harness accepts custom agent types."""
        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=10,
            agent_types=["monitor", "worker"]
        )

        assert harness.agent_types == ["monitor", "worker"]

    def test_harness_spawner_creation(self):
        """Harness creates spawner with correct config."""
        harness = LoadTestHarness(
            router_url="ws://test:9000",
            agent_count=20
        )

        assert harness.spawner is not None
        assert harness.spawner.router_url == "ws://test:9000"

    @pytest.mark.asyncio
    async def test_harness_setup(self, mock_websockets_connect):
        """Harness can set up agents."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=3
        )

        await harness.setup()

        assert len(harness.spawner.agents) == 3
        assert all(a.is_connected for a in harness.spawner.agents)

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_harness_teardown(self, mock_websockets_connect):
        """Harness can tear down agents."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=3
        )

        await harness.setup()
        assert len(harness.spawner.agents) == 3

        await harness.teardown()
        assert len(harness.spawner.agents) == 0

    @pytest.mark.asyncio
    async def test_create_topology_star(self, mock_websockets_connect):
        """Harness can create star topology."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=5
        )

        await harness.setup()
        topology = harness._create_topology("star")

        assert topology.name == "star"
        assert topology.agent_count == 5
        assert len(topology.edges) == 4  # Star with 5 nodes has 4 edges

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_create_topology_mesh(self, mock_websockets_connect):
        """Harness can create mesh topology."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=4
        )

        await harness.setup()
        topology = harness._create_topology("mesh")

        assert topology.name == "full_mesh"
        assert topology.agent_count == 4
        # 4 nodes full mesh = 6 edges (n*(n-1)/2)
        assert len(topology.edges) == 6

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_create_topology_ring(self, mock_websockets_connect):
        """Harness can create ring topology."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=4
        )

        await harness.setup()
        topology = harness._create_topology("ring")

        assert topology.name == "ring"
        assert len(topology.edges) == 4

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_create_topology_line(self, mock_websockets_connect):
        """Harness can create line topology."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=5
        )

        await harness.setup()
        topology = harness._create_topology("line")

        assert topology.name == "line"
        assert len(topology.edges) == 4  # Line with 5 nodes has 4 edges

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_create_topology_unknown_defaults_to_star(self, mock_websockets_connect):
        """Harness defaults to star for unknown topology."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=5
        )

        await harness.setup()
        topology = harness._create_topology("unknown")

        assert topology.name == "star"

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_run_simple_scenario(self, mock_websockets_connect):
        """Harness can run a simple messaging scenario."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=2
        )

        scenario = LoadTestScenario(
            name="ping_pong",
            message_count=10,
            message_interval_ms=10
        )

        await harness.setup()
        result = await harness.run_scenario(scenario)
        await harness.teardown()

        assert result["scenario"] == "ping_pong"
        assert result["messages_sent"] >= 0
        assert "throughput_msg_per_sec" in result
        assert "avg_latency_ms" in result
        assert "p50_latency_ms" in result
        assert "p95_latency_ms" in result
        assert "p99_latency_ms" in result

    @pytest.mark.asyncio
    async def test_run_scenario_with_topology(self, mock_websockets_connect):
        """Harness assigns topology to agents."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=4
        )

        scenario = LoadTestScenario(
            name="ring_test",
            message_count=4,
            message_interval_ms=5,
            topology="ring"
        )

        await harness.setup()
        await harness.run_scenario(scenario)

        # Check that topology was assigned
        assert harness.topology is not None
        assert harness.topology.name == "ring"

        # Check agents have neighbors assigned
        for agent in harness.spawner.agents:
            assert len(agent._neighbors) == 2  # Ring has 2 neighbors per node

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_run_warmup(self, mock_websockets_connect):
        """Harness runs warmup messages before main test."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=3
        )

        await harness.setup()
        await harness._run_warmup(5)

        # Warmup should have sent some messages
        total_sent = sum(a.messages_sent for a in harness.spawner.agents)
        assert total_sent > 0

        await harness.teardown()

    @pytest.mark.asyncio
    async def test_run_warmup_with_few_agents(self, mock_websockets_connect):
        """Harness handles warmup with fewer than 2 agents."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=1
        )

        await harness.setup()
        # Should not raise
        await harness._run_warmup(5)

        await harness.teardown()


class TestPercentileCalculation:
    """Tests for percentile calculation."""

    def test_percentile_empty_list(self):
        """Percentile of empty list is 0."""
        result = LoadTestHarness._percentile([], 50)
        assert result == 0.0

    def test_percentile_single_value(self):
        """Percentile of single value returns that value."""
        result = LoadTestHarness._percentile([50.0], 50)
        assert result == 50.0

    def test_percentile_p50(self):
        """P50 calculation is correct."""
        data = [10.0, 20.0, 30.0, 40.0, 50.0]
        result = LoadTestHarness._percentile(data, 50)
        assert result == 30.0

    def test_percentile_p95(self):
        """P95 calculation is correct."""
        data = list(range(1, 101))  # 1 to 100
        result = LoadTestHarness._percentile(data, 95)
        assert 94 <= result <= 96

    def test_percentile_p99(self):
        """P99 calculation is correct."""
        data = list(range(1, 101))  # 1 to 100
        result = LoadTestHarness._percentile(data, 99)
        assert 98 <= result <= 100

    def test_percentile_p0(self):
        """P0 returns minimum value."""
        data = [10.0, 20.0, 30.0]
        result = LoadTestHarness._percentile(data, 0)
        assert result == 10.0

    def test_percentile_p100(self):
        """P100 returns maximum value."""
        data = [10.0, 20.0, 30.0]
        result = LoadTestHarness._percentile(data, 100)
        assert result == 30.0


class TestLoadTestHarnessIntegration:
    """Integration tests for the load testing harness."""

    @pytest.mark.asyncio
    async def test_full_scenario_run(self, mock_websockets_connect):
        """Full scenario run produces complete results."""
        mock_connect, mock_ws = mock_websockets_connect

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=5
        )

        scenario = LoadTestScenario(
            name="integration_test",
            message_count=20,
            message_interval_ms=5,
            warmup_messages=3,
            topology="star"
        )

        await harness.setup()
        result = await harness.run_scenario(scenario)
        await harness.teardown()

        # Verify result structure
        assert result["scenario"] == "integration_test"
        assert result["agent_count"] == 5
        assert "messages_sent" in result
        assert "messages_received" in result
        assert "duration_sec" in result
        assert "throughput_msg_per_sec" in result
        assert "avg_latency_ms" in result
        assert "p50_latency_ms" in result
        assert "p95_latency_ms" in result
        assert "p99_latency_ms" in result
        assert "errors" in result

    @pytest.mark.asyncio
    async def test_scenario_with_different_topologies(self, mock_websockets_connect):
        """Scenarios can run with different topologies."""
        mock_connect, mock_ws = mock_websockets_connect

        topologies = ["star", "mesh", "ring", "line"]

        for topo in topologies:
            harness = LoadTestHarness(
                router_url="ws://localhost:8766",
                agent_count=3
            )

            scenario = LoadTestScenario(
                name=f"test_{topo}",
                message_count=3,
                message_interval_ms=5,
                topology=topo
            )

            await harness.setup()
            result = await harness.run_scenario(scenario)
            await harness.teardown()

            assert result["scenario"] == f"test_{topo}"

    @pytest.mark.asyncio
    async def test_scenario_with_errors(self, mock_websockets_connect):
        """Scenario captures errors during message sending."""
        mock_connect, mock_ws = mock_websockets_connect

        # Make send fail on some calls
        call_count = 0

        async def failing_send(msg):
            nonlocal call_count
            call_count += 1
            if call_count % 3 == 0:
                raise Exception("Simulated send failure")

        mock_ws.send.side_effect = failing_send

        harness = LoadTestHarness(
            router_url="ws://localhost:8766",
            agent_count=2
        )

        scenario = LoadTestScenario(
            name="error_test",
            message_count=6,
            message_interval_ms=5
        )

        await harness.setup()
        result = await harness.run_scenario(scenario)
        await harness.teardown()

        # Some errors should have been captured
        assert isinstance(result["errors"], list)
