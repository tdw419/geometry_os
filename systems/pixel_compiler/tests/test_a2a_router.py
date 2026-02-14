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


class TestRoutingExtended:
    """Extended tests for message routing."""

    @pytest.mark.asyncio
    async def test_route_message_to_online_agent(self, router):
        """Can route message to an online agent."""
        from systems.pixel_compiler.a2a_router import A2AMessage
        mock_conn = AsyncMock()
        await router.register_agent("sender", AsyncMock(), {"agent_type": "monitor"})
        await router.register_agent("receiver", mock_conn, {"agent_type": "executor"})

        message = A2AMessage(
            message_id="msg-002",
            timestamp=0.0,
            from_agent="sender",
            to_agent="receiver",
            message_type="task_request",
            content={"task": "scan"}
        )
        result = await router.route_message("sender", "receiver", message)

        assert result is True
        mock_conn.send.assert_called_once()

    @pytest.mark.asyncio
    async def test_route_message_to_offline_agent(self, router):
        """Returns error for offline agent."""
        from systems.pixel_compiler.a2a_router import A2AMessage

        message = A2AMessage(
            message_id="msg-003",
            timestamp=0.0,
            from_agent="sender",
            to_agent="nonexistent",
            message_type="task_request",
            content={}
        )
        result = await router.route_message("sender", "nonexistent", message)

        assert result is False


class TestBroadcastExtended:
    """Extended tests for broadcast messaging."""

    @pytest.mark.asyncio
    async def test_broadcast_to_all_agents(self, router):
        """Can broadcast to all agents."""
        from systems.pixel_compiler.a2a_router import A2AMessage
        conns = [AsyncMock() for _ in range(3)]

        await router.register_agent("sender", conns[0], {"agent_type": "monitor"})
        await router.register_agent("agent-1", conns[1], {"agent_type": "executor"})
        await router.register_agent("agent-2", conns[2], {"agent_type": "evolver"})

        message = A2AMessage(
            message_id="broadcast-002",
            timestamp=0.0,
            from_agent="sender",
            to_agent=None,
            message_type="status_update",
            content={}
        )
        result = await router.broadcast(
            "sender",
            agent_type=None,  # None means broadcast to all types
            message=message,
            exclude_self=True
        )

        assert result == 2

    @pytest.mark.asyncio
    async def test_broadcast_to_specific_type(self, router):
        """Can broadcast to agents of specific type."""
        from systems.pixel_compiler.a2a_router import A2AMessage
        conns = [AsyncMock() for _ in range(4)]

        await router.register_agent("sender", conns[0], {"agent_type": "monitor"})
        await router.register_agent("monitor-1", conns[1], {"agent_type": "monitor"})
        await router.register_agent("monitor-2", conns[2], {"agent_type": "monitor"})
        await router.register_agent("executor-1", conns[3], {"agent_type": "executor"})

        message = A2AMessage(
            message_id="broadcast-003",
            timestamp=0.0,
            from_agent="sender",
            to_agent=None,
            message_type="status_update",
            content={}
        )
        result = await router.broadcast(
            "sender",
            agent_type="monitor",
            message=message,
            exclude_self=True
        )

        # Only monitor-1 and monitor-2 should receive (sender excluded)
        assert result == 2


class TestSubscriptions:
    """Tests for event subscriptions."""

    @pytest.mark.asyncio
    async def test_subscribe_to_event(self, router):
        """Agent can subscribe to events."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-1", mock_conn, {"agent_type": "monitor"})

        await router.subscribe("agent-1", "region_change")

        assert "region_change" in router.subscriptions
        assert len(router.subscriptions["region_change"]) == 1

    @pytest.mark.asyncio
    async def test_notify_subscribers(self, router):
        """Subscribers receive notifications."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-1", mock_conn, {"agent_type": "monitor"})
        await router.subscribe("agent-1", "agent_registered")

        # Register another agent to trigger notification
        await router.register_agent("agent-2", AsyncMock(), {"agent_type": "executor"})

        # agent-1 should have received agent_registered notification
        assert mock_conn.send.call_count >= 1


class TestA2AAreaAgentIntegration:
    """Tests for A2A integration with spawned area agents."""

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    @pytest.mark.asyncio
    async def test_agent_auto_register_on_connect(self, router):
        """Agent is automatically registered when connecting to router."""
        mock_conn = AsyncMock()

        # Simulate agent connecting
        await router.register_agent(
            "area-agent-001",
            mock_conn,
            {
                "agent_type": "monitor",
                "region": {"x": 0, "y": 0, "width": 100, "height": 100},
                "capabilities": ["scan", "detect"]
            }
        )

        # Verify registration
        assert "area-agent-001" in router.peer_registry
        assert router.peer_registry["area-agent-001"].agent_type == "monitor"

    @pytest.mark.asyncio
    async def test_multiple_agents_can_discover_each_other(self, router):
        """Multiple spawned agents can discover each other."""
        # Spawn multiple agents
        for i in range(3):
            await router.register_agent(
                f"area-agent-{i:03d}",
                AsyncMock(),
                {
                    "agent_type": "monitor" if i < 2 else "executor",
                    "region": {"x": i * 100, "y": 0, "width": 100, "height": 100}
                }
            )

        # Discover monitors
        monitors = await router.discover_peers(agent_type="monitor")
        assert len(monitors) == 2

        # Discover executors
        executors = await router.discover_peers(agent_type="executor")
        assert len(executors) == 1

    @pytest.mark.asyncio
    async def test_agents_in_adjacent_regions_can_communicate(self, router):
        """Agents in overlapping/adjacent regions can find each other."""
        # Agent 1: region (0,0) to (100,100)
        await router.register_agent(
            "agent-left",
            AsyncMock(),
            {
                "agent_type": "monitor",
                "region": {"x": 0, "y": 0, "width": 100, "height": 100}
            }
        )

        # Agent 2: region (90,0) to (190,100) - overlaps with Agent 1
        await router.register_agent(
            "agent-right",
            AsyncMock(),
            {
                "agent_type": "monitor",
                "region": {"x": 90, "y": 0, "width": 100, "height": 100}
            }
        )

        # Find agents overlapping with agent-left's region
        overlapping = await router.discover_peers(
            region_overlaps={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        # Should find both (agent-left and overlapping agent-right)
        assert len(overlapping) == 2

    @pytest.mark.asyncio
    async def test_agent_broadcast_to_type(self, router):
        """Agent can broadcast to all agents of a specific type."""
        mock_monitor = AsyncMock()
        mock_executor = AsyncMock()

        await router.register_agent("sender", AsyncMock(), {"agent_type": "coordinator"})
        await router.register_agent("monitor-1", mock_monitor, {"agent_type": "monitor"})
        await router.register_agent("executor-1", mock_executor, {"agent_type": "executor"})

        # Create proper broadcast message
        from systems.pixel_compiler.a2a_router import A2AMessage
        broadcast_msg = A2AMessage(
            message_id="broadcast-004",
            timestamp=0.0,
            from_agent="sender",
            to_agent=None,
            message_type="task_available",
            content={"task": "scan"}
        )

        # Broadcast to monitors only
        result = await router.broadcast(
            "sender",
            agent_type="monitor",
            message=broadcast_msg,
            exclude_self=True
        )

        assert result == 1
        # Monitor should have received message
        mock_monitor.send.assert_called_once()
        # Executor should NOT have received message
        mock_executor.send.assert_not_called()


class TestA2ACoordinationPrimitives:
    """Tests for distributed coordination primitives (locks and barriers)."""

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    # === Lock Tests ===

    @pytest.mark.asyncio
    async def test_acquire_lock_free(self, router):
        """Can acquire a lock when it's free."""
        mock_conn = AsyncMock()
        # Use _handle_register to properly set up connections dict
        await router._handle_register({
            "agent_id": "agent-1",
            "agent_type": "monitor"
        }, mock_conn)

        result = await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn)

        assert result["type"] == "ack"
        assert result["granted"] is True
        assert "expires_at" in result

    @pytest.mark.asyncio
    async def test_acquire_lock_held_by_other(self, router):
        """Lock request is queued when held by another agent."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router._handle_register({
            "agent_id": "agent-1",
            "agent_type": "monitor"
        }, mock_conn1)
        await router._handle_register({
            "agent_id": "agent-2",
            "agent_type": "executor"
        }, mock_conn2)

        # Agent 1 acquires lock
        await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn1)

        # Agent 2 tries to acquire
        result = await router._handle_lock_request({
            "agent_id": "agent-2",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn2)

        assert result["granted"] is False
        assert result["queue_position"] == 1

    @pytest.mark.asyncio
    async def test_release_lock_grants_to_next(self, router):
        """Releasing a lock grants it to next agent in queue."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router._handle_register({
            "agent_id": "agent-1",
            "agent_type": "monitor"
        }, mock_conn1)
        await router._handle_register({
            "agent_id": "agent-2",
            "agent_type": "executor"
        }, mock_conn2)

        # Agent 1 acquires, Agent 2 queues
        await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn1)

        await router._handle_lock_request({
            "agent_id": "agent-2",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn2)

        # Agent 1 releases
        result = await router._handle_lock_release({
            "agent_id": "agent-1",
            "lock_id": "test-lock"
        }, mock_conn1)

        assert result["released"] is True
        # Agent 2 should have received lock_granted notification
        mock_conn2.send.assert_called()

    @pytest.mark.asyncio
    async def test_lock_reentrant(self, router):
        """Same agent can re-acquire lock they already hold."""
        mock_conn = AsyncMock()
        await router._handle_register({
            "agent_id": "agent-1",
            "agent_type": "monitor"
        }, mock_conn)

        # First acquire
        await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn)

        # Re-acquire (reentrant)
        result = await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 60
        }, mock_conn)

        assert result["granted"] is True

    # === Barrier Tests ===

    @pytest.mark.asyncio
    async def test_barrier_not_released_until_full(self, router):
        """Barrier does not release until expected count reached."""
        mock_conn = AsyncMock()
        await router._handle_register({
            "agent_id": "agent-1",
            "agent_type": "monitor"
        }, mock_conn)

        result = await router._handle_barrier_enter({
            "agent_id": "agent-1",
            "barrier_id": "test-barrier",
            "expected_count": 2
        }, mock_conn)

        assert result["released"] is False
        assert result["arrived_count"] == 1
        assert result["expected_count"] == 2

    @pytest.mark.asyncio
    async def test_barrier_releases_when_full(self, router):
        """Barrier releases all agents when expected count reached."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router._handle_register({
            "agent_id": "agent-1",
            "agent_type": "monitor"
        }, mock_conn1)
        await router._handle_register({
            "agent_id": "agent-2",
            "agent_type": "executor"
        }, mock_conn2)

        # Agent 1 enters
        await router._handle_barrier_enter({
            "agent_id": "agent-1",
            "barrier_id": "test-barrier",
            "expected_count": 2
        }, mock_conn1)

        # Agent 2 enters - should trigger release
        result = await router._handle_barrier_enter({
            "agent_id": "agent-2",
            "barrier_id": "test-barrier",
            "expected_count": 2
        }, mock_conn2)

        assert result["released"] is True
        assert result["arrived_count"] == 2
        # Both agents should have received barrier_release notification
        mock_conn1.send.assert_called()
        mock_conn2.send.assert_called()


class TestA2ATaskDelegation:
    """Tests for task delegation pattern."""

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    @pytest.mark.asyncio
    async def test_assign_task(self, router):
        """Can assign a task to another agent."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        result = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        assert result["status"] == "assigned"
        assert "task_id" in result
        # Note: Notification requires WebSocket connection in legacy connections dict

    @pytest.mark.asyncio
    async def test_report_progress(self, router):
        """Agent can report task progress."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        # Assign task
        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        # Report progress
        result = await router.report_progress(
            task_id=task_id,
            agent_id="worker",
            progress=0.5,
            status="in_progress"
        )

        assert result["progress"] == 0.5
        assert result["status"] == "in_progress"

    @pytest.mark.asyncio
    async def test_complete_task(self, router):
        """Agent can complete a task with result."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        # Assign and complete
        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        result = await router.complete_task(
            task_id=task_id,
            agent_id="worker",
            result={"pixels_scanned": 10000, "anomalies": 3},
            success=True
        )

        assert result["status"] == "completed"
        assert result["success"] is True

    @pytest.mark.asyncio
    async def test_get_task_status(self, router):
        """Can query task status."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        # Get task status
        status = await router.get_task(task_id)

        assert status is not None
        assert status["status"] == "assigned"
        assert status["progress"] == 0.0

    @pytest.mark.asyncio
    async def test_task_failed(self, router):
        """Task can be marked as failed."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        result = await router.complete_task(
            task_id=task_id,
            agent_id="worker",
            result={"error": "Region locked by another agent"},
            success=False
        )

        assert result["status"] == "failed"

    @pytest.mark.asyncio
    async def test_list_tasks(self, router):
        """Can list tasks with filters."""
        mock_conn = AsyncMock()
        await router.register_agent("coordinator", mock_conn, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn, {"agent_type": "executor"})

        # Create multiple tasks
        await router.assign_task("coordinator", "worker", "task1", {})
        await router.assign_task("coordinator", "worker", "task2", {})

        tasks = await router.list_tasks(agent_id="worker")

        assert len(tasks) == 2


class TestBuildSession:
    """Tests for collaborative build sessions."""

    def test_build_session_dataclass(self):
        """BuildSession dataclass exists with required fields."""
        from systems.pixel_compiler.a2a_router import BuildSession
        import time

        session = BuildSession(
            session_id="sess_001",
            session_name="Test Session",
            created_at=time.time(),
            max_agents=10,
            grid_size=1000,
            coordination_mode="coordinated",
            invite_token="token_abc",
            config={}
        )

        assert session.session_id == "sess_001"
        assert session.session_name == "Test Session"
        assert session.agents == {}
        assert session.regions == {}

    def test_session_agent_dataclass(self):
        """SessionAgent dataclass exists with required fields."""
        from systems.pixel_compiler.a2a_router import SessionAgent
        import time

        agent = SessionAgent(
            agent_id="agent_001",
            session_id="sess_001",
            name="Builder-A",
            role="builder",
            capabilities=["wgsl", "kernel"],
            color="#4CAF50",
            joined_at=time.time()
        )

        assert agent.agent_id == "agent_001"
        assert agent.role == "builder"
        assert agent.regions_claimed == []
        assert agent.tasks_completed == 0

    def test_region_claim_dataclass(self):
        """RegionClaim dataclass exists with required fields."""
        from systems.pixel_compiler.a2a_router import RegionClaim
        import time

        claim = RegionClaim(
            claim_id="claim_001",
            session_id="sess_001",
            agent_id="agent_001",
            bounds={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="building",
            claimed_at=time.time(),
            expires_at=time.time() + 3600
        )

        assert claim.claim_id == "claim_001"
        assert claim.agent_id == "agent_001"
        assert claim.bounds["x"] == 0
        assert claim.bounds["width"] == 100
        assert claim.exclusive is True
