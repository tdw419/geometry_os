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


class TestTopologyConfiguration:
    """Tests for agent mesh topology configuration."""

    def test_star_topology_creation(self):
        """Can create star topology (hub-spoke)."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.star(agent_count=5)
        edges = topology.get_edges()

        # Star: node 0 connects to all others
        assert len(edges) == 4  # 4 edges from center
        assert all((0, i) in edges or (i, 0) in edges for i in range(1, 5))

    def test_star_topology_custom_hub(self):
        """Can create star topology with custom hub index."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.star(agent_count=5, hub_index=2)
        edges = topology.get_edges()

        # Hub (node 2) connects to all others
        assert len(edges) == 4
        # Check that hub 2 has edges to all other nodes
        for i in range(5):
            if i != 2:
                assert (2, i) in edges or (i, 2) in edges

    def test_mesh_topology_creation(self):
        """Can create full mesh topology."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.full_mesh(agent_count=4)
        edges = topology.get_edges()

        # Full mesh: each node connects to every other
        # 4 nodes = 6 edges (n*(n-1)/2)
        assert len(edges) == 6

    def test_ring_topology_creation(self):
        """Can create ring topology."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.ring(agent_count=4)
        edges = topology.get_edges()

        # Ring: each node connects to next (circular)
        assert len(edges) == 4

    def test_line_topology_creation(self):
        """Can create line topology."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.line(agent_count=4)
        edges = topology.get_edges()

        # Line: node i connects to node i+1
        assert len(edges) == 3

    def test_hierarchical_topology_creation(self):
        """Can create hierarchical tree topology."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        # 3 levels with fanout 2: 1 + 2 + 4 = 7 nodes
        topology = TopologyBuilder.hierarchical(levels=3, fanout=2)
        edges = topology.get_edges()

        # Total nodes: 1 + 2 + 4 = 7
        assert topology.agent_count == 7
        # Root has 2 children, each child has 2 children
        # Edges: 2 (from root) + 4 (from level 1) = 6
        assert len(edges) == 6

    def test_topology_get_neighbors(self):
        """Can get neighbors for a node."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.star(agent_count=5)
        neighbors = topology.get_neighbors(0)

        # Center node has all others as neighbors
        assert len(neighbors) == 4
        assert all(i in neighbors for i in range(1, 5))

    def test_topology_get_neighbors_ring(self):
        """Can get neighbors for a node in ring topology."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.ring(agent_count=4)
        neighbors = topology.get_neighbors(0)

        # Node 0 should have neighbors: 1 (next) and 3 (previous in ring)
        assert len(neighbors) == 2
        assert 1 in neighbors
        assert 3 in neighbors

    def test_topology_assigns_agents(self):
        """Topology can be assigned to agent list."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.ring(agent_count=3)
        agents = [VirtualAgent(f"agent-{i}", "test") for i in range(3)]

        topology.assign_agents(agents)

        # Each agent should know its neighbors
        assert len(agents[0]._neighbors) == 2  # Ring: 2 neighbors each

    def test_topology_name_and_count(self):
        """Topology has name and agent_count attributes."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.star(agent_count=10)

        assert topology.name == "star"
        assert topology.agent_count == 10

    def test_line_topology_edge_connectivity(self):
        """Line topology has correct edge connectivity."""
        from systems.pixel_compiler.a2a_load_test.topology import TopologyBuilder

        topology = TopologyBuilder.line(agent_count=5)
        edges = topology.get_edges()

        # Line: 0-1, 1-2, 2-3, 3-4
        assert (0, 1) in edges
        assert (1, 2) in edges
        assert (2, 3) in edges
        assert (3, 4) in edges
        assert (0, 4) not in edges  # No wrap-around
