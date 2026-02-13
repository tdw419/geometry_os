"""Tests for A2A Router - Agent-to-Agent message routing hub."""
import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock
from systems.pixel_compiler.a2a_router import A2ARouter, AgentConnection


@pytest.fixture
def router():
    """Create a fresh A2A router for each test."""
    return A2ARouter()


class TestA2ARouter:
    """Unit tests for A2A message routing."""

    def test_router_initialization(self, router):
        """Router initializes with empty registry."""
        assert router.peer_registry == {}
        assert router.subscriptions == {}


class TestPeerRegistration:
    """Tests for agent registration and discovery."""

    @pytest.mark.asyncio
    async def test_register_agent(self, router):
        """Agent can register with the router."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-001", mock_conn, {
            "agent_type": "monitor",
            "region": {"x": 0, "y": 0, "width": 100, "height": 100}
        })

        assert "agent-001" in router.peer_registry
        assert router.peer_registry["agent-001"].agent_type == "monitor"

    @pytest.mark.asyncio
    async def test_unregister_agent(self, router):
        """Agent can be unregistered from the router."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-001", mock_conn, {"agent_type": "monitor"})

        await router.unregister_agent("agent-001")

        assert "agent-001" not in router.peer_registry

    @pytest.mark.asyncio
    async def test_discover_peers_by_type(self, router):
        """Can discover agents by type."""
        mock_conn = AsyncMock()

        await router.register_agent("agent-001", mock_conn, {"agent_type": "monitor"})
        await router.register_agent("agent-002", mock_conn, {"agent_type": "evolver"})
        await router.register_agent("agent-003", mock_conn, {"agent_type": "monitor"})

        monitors = await router.discover_peers(agent_type="monitor")

        assert len(monitors) == 2
        assert all(a["agent_type"] == "monitor" for a in monitors)


class TestMessageRouting:
    """Tests for direct message routing and broadcast."""

    @pytest.mark.asyncio
    async def test_route_message_to_agent(self, router):
        """Can route a direct message to another agent."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("agent-001", mock_conn1, {"agent_type": "monitor"})
        await router.register_agent("agent-002", mock_conn2, {"agent_type": "evolver"})

        from systems.pixel_compiler.a2a_router import A2AMessage
        message = A2AMessage(
            message_id="msg-001",
            timestamp=0.0,
            from_agent="agent-001",
            to_agent="agent-002",
            message_type="request",
            content={"action": "mutate"}
        )

        result = await router.route_message("agent-001", "agent-002", message)

        assert result is True

    @pytest.mark.asyncio
    async def test_broadcast_to_all_agents(self, router):
        """Can broadcast a message to all agents of a type."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()
        mock_conn3 = AsyncMock()

        await router.register_agent("agent-001", mock_conn1, {"agent_type": "monitor"})
        await router.register_agent("agent-002", mock_conn2, {"agent_type": "evolver"})
        await router.register_agent("agent-003", mock_conn3, {"agent_type": "monitor"})

        from systems.pixel_compiler.a2a_router import A2AMessage
        message = A2AMessage(
            message_id="broadcast-001",
            timestamp=0.0,
            from_agent="agent-001",
            to_agent=None,
            message_type="broadcast",
            content={"event": "update"}
        )

        delivered = await router.broadcast("agent-001", agent_type="monitor", message=message, exclude_self=True)

        # Should deliver to agent-003 only (agent-001 is excluded, agent-002 is wrong type)
        assert delivered == 1
