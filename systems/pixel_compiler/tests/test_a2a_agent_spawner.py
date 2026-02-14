# systems/pixel_compiler/tests/test_a2a_agent_spawner.py
import pytest
import pytest_asyncio
import asyncio
import json
from unittest.mock import AsyncMock, MagicMock, patch
from systems.pixel_compiler.a2a_load_test.agent_spawner import VirtualAgent, AgentSpawner


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


class TestVirtualAgent:
    """Tests for virtual agent abstraction."""

    def test_virtual_agent_initialization(self):
        """Virtual agent can be initialized with config."""
        agent = VirtualAgent(
            agent_id="test-agent-001",
            agent_type="scanner",
            capabilities=["scan", "detect"],
            region={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        assert agent.agent_id == "test-agent-001"
        assert agent.agent_type == "scanner"
        assert "scan" in agent.capabilities

    def test_virtual_agent_message_creation(self):
        """Virtual agent can create A2A messages."""
        agent = VirtualAgent(
            agent_id="sender",
            agent_type="monitor"
        )

        msg = agent.create_message(
            to_agent="receiver",
            message_type="task_request",
            content={"task": "scan"}
        )

        assert msg["from_agent"] == "sender"
        assert msg["to_agent"] == "receiver"
        assert msg["message_type"] == "task_request"
        assert msg["content"]["task"] == "scan"

    def test_virtual_agent_broadcast_creation(self):
        """Virtual agent can create broadcast messages."""
        agent = VirtualAgent(
            agent_id="broadcaster",
            agent_type="coordinator"
        )

        msg = agent.create_broadcast(
            message_type="status_update",
            content={"status": "active"},
            agent_type="worker"
        )

        assert msg["type"] == "broadcast"
        assert msg["from_agent"] == "broadcaster"
        assert msg["agent_type"] == "worker"
        assert msg["message_type"] == "status_update"
        assert msg["content"]["status"] == "active"

    def test_virtual_agent_stats_tracking(self):
        """Virtual agent tracks messaging statistics."""
        agent = VirtualAgent(
            agent_id="stats-agent",
            agent_type="monitor"
        )

        # Initial stats
        assert agent.messages_sent == 0
        assert agent.messages_received == 0
        assert agent.avg_latency_ms == 0.0

    def test_virtual_agent_avg_latency(self):
        """Virtual agent calculates average latency correctly."""
        agent = VirtualAgent(
            agent_id="latency-agent",
            agent_type="monitor"
        )

        # No messages yet
        assert agent.avg_latency_ms == 0.0

        # Simulate some messages
        agent.messages_received = 2
        agent.total_latency_ms = 100.0

        assert agent.avg_latency_ms == 50.0

    @pytest.mark.asyncio
    async def test_virtual_agent_can_connect(self, mock_websockets_connect):
        """Virtual agent can connect to A2A router."""
        mock_connect, mock_ws = mock_websockets_connect

        agent = VirtualAgent(
            agent_id="test-conn-agent",
            agent_type="monitor"
        )

        await agent.connect("ws://localhost:8766")

        assert agent.is_connected is True

        await agent.disconnect()
        assert agent.is_connected is False

    @pytest.mark.asyncio
    async def test_virtual_agent_disconnect(self, mock_websockets_connect):
        """Virtual agent can disconnect from router."""
        mock_connect, mock_ws = mock_websockets_connect

        agent = VirtualAgent(
            agent_id="test-disconnect-agent",
            agent_type="monitor"
        )

        await agent.connect("ws://localhost:8766")
        assert agent.is_connected is True

        await agent.disconnect()
        assert agent.is_connected is False

    @pytest.mark.asyncio
    async def test_virtual_agent_send_message(self, mock_websockets_connect):
        """Virtual agent can send messages and track latency."""
        mock_connect, mock_ws = mock_websockets_connect

        agent = VirtualAgent(
            agent_id="sender-agent",
            agent_type="monitor"
        )

        await agent.connect("ws://localhost:8766")

        msg = agent.create_message(
            to_agent="receiver",
            message_type="ping",
            content={"test": True}
        )

        response = await agent.send_message(msg)

        assert agent.messages_sent == 1
        assert agent.messages_received == 1
        assert response["type"] == "ack"

        await agent.disconnect()

    @pytest.mark.asyncio
    async def test_virtual_agent_send_message_not_connected(self):
        """Virtual agent raises error if sending without connection."""
        agent = VirtualAgent(
            agent_id="unconnected-agent",
            agent_type="monitor"
        )

        msg = agent.create_message(
            to_agent="receiver",
            message_type="ping",
            content={}
        )

        with pytest.raises(RuntimeError, match="Agent not connected"):
            await agent.send_message(msg)


class TestAgentSpawner:
    """Tests for spawning multiple agents."""

    def test_spawner_initialization(self):
        """Spawner initializes with configuration."""
        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_count=10
        )

        assert spawner.router_url == "ws://localhost:8766"
        assert spawner.agent_count == 10
        assert len(spawner.agents) == 0

    def test_spawner_with_agent_types(self):
        """Spawner accepts agent types configuration."""
        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_types=["monitor", "evolver"],
            agents_per_type=3
        )

        assert spawner.agent_types == ["monitor", "evolver"]
        assert spawner.agents_per_type == 3

    @pytest.mark.asyncio
    async def test_spawn_single_agent(self, mock_websockets_connect):
        """Spawner can spawn a single agent."""
        mock_connect, mock_ws = mock_websockets_connect

        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_count=1
        )

        await spawner.spawn()

        assert len(spawner.agents) == 1
        assert spawner.agents[0].is_connected

        await spawner.shutdown()

    @pytest.mark.asyncio
    async def test_spawn_multiple_agents(self, mock_websockets_connect):
        """Spawner can spawn multiple agents."""
        mock_connect, mock_ws = mock_websockets_connect

        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_count=5
        )

        await spawner.spawn()

        assert len(spawner.agents) == 5
        assert all(a.is_connected for a in spawner.agents)

        await spawner.shutdown()

    @pytest.mark.asyncio
    async def test_spawn_with_mixed_types(self, mock_websockets_connect):
        """Spawner can spawn agents of different types."""
        mock_connect, mock_ws = mock_websockets_connect

        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_types=["monitor", "evolver", "executor"],
            agents_per_type=2
        )

        await spawner.spawn()

        # 3 types * 2 each = 6 agents
        assert len(spawner.agents) == 6

        type_counts = {}
        for agent in spawner.agents:
            type_counts[agent.agent_type] = type_counts.get(agent.agent_type, 0) + 1

        assert type_counts["monitor"] == 2
        assert type_counts["evolver"] == 2
        assert type_counts["executor"] == 2

        await spawner.shutdown()

    @pytest.mark.asyncio
    async def test_spawner_shutdown(self, mock_websockets_connect):
        """Spawner can shutdown all agents."""
        mock_connect, mock_ws = mock_websockets_connect

        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_count=3
        )

        await spawner.spawn()
        assert len(spawner.agents) == 3

        await spawner.shutdown()
        assert len(spawner.agents) == 0

    def test_spawner_get_stats_empty(self):
        """Spawner can get aggregate statistics when no agents."""
        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_count=3
        )

        # Get stats when no agents spawned
        stats = spawner.get_stats()
        assert stats["agents"] == 0

    @pytest.mark.asyncio
    async def test_spawner_get_stats_with_agents(self, mock_websockets_connect):
        """Spawner can get aggregate statistics with spawned agents."""
        mock_connect, mock_ws = mock_websockets_connect

        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_count=3
        )

        await spawner.spawn()

        stats = spawner.get_stats()

        assert stats["agents"] == 3
        assert stats["connected"] == 3

        await spawner.shutdown()

    @pytest.mark.asyncio
    async def test_spawner_get_stats_with_latency(self, mock_websockets_connect):
        """Spawner stats include latency metrics."""
        mock_connect, mock_ws = mock_websockets_connect

        spawner = AgentSpawner(
            router_url="ws://localhost:8766",
            agent_count=2
        )

        await spawner.spawn()

        # Simulate some messages
        for agent in spawner.agents:
            msg = agent.create_message("other", "ping", {})
            await agent.send_message(msg)

        stats = spawner.get_stats()

        assert stats["messages_sent"] == 2
        assert stats["messages_received"] == 2
        assert stats["avg_latency_ms"] > 0

        await spawner.shutdown()
