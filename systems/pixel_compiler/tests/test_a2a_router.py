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

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    def test_sessions_registry_exists(self, router):
        """A2ARouter has a sessions registry."""
        assert hasattr(router, 'sessions')
        assert router.sessions == {}

    @pytest.mark.asyncio
    async def test_create_session(self, router):
        """Can create a new build session."""
        result = await router.create_session(
            session_name="Test Build",
            max_agents=5,
            coordination_mode="coordinated"
        )

        assert result["success"] is True
        assert "session_id" in result
        assert result["session_name"] == "Test Build"
        assert result["max_agents"] == 5
        assert "invite_token" in result

        # Session is stored in registry
        assert result["session_id"] in router.sessions

    @pytest.mark.asyncio
    async def test_create_session_default_values(self, router):
        """Session created with default values."""
        result = await router.create_session(session_name="Default")

        assert result["max_agents"] == 10
        assert result["grid_size"] == 1000
        assert result["coordination_mode"] == "coordinated"

    @pytest.mark.asyncio
    async def test_join_session(self, router):
        """Agent can join a session."""
        # Create session first
        session = await router.create_session(session_name="Test")

        result = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder-A",
            role="builder",
            capabilities=["wgsl"]
        )

        assert result["success"] is True
        assert "agent_id" in result
        assert result["role"] == "builder"
        assert "assigned_color" in result

    @pytest.mark.asyncio
    async def test_join_nonexistent_session(self, router):
        """Cannot join nonexistent session."""
        result = await router.join_session(
            session_id="sess_nonexistent",
            agent_name="Builder",
            role="builder"
        )

        assert result["success"] is False
        assert "not_found" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_join_session_full(self, router):
        """Cannot join full session."""
        session = await router.create_session(session_name="Full", max_agents=1)
        await router.join_session(
            session_id=session["session_id"],
            agent_name="Agent1",
            role="builder"
        )

        result = await router.join_session(
            session_id=session["session_id"],
            agent_name="Agent2",
            role="builder"
        )

        assert result["success"] is False
        assert "full" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_leave_session(self, router):
        """Agent can leave a session."""
        session = await router.create_session(session_name="Test")
        joined = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        result = await router.leave_session(
            session_id=session["session_id"],
            agent_id=joined["agent_id"]
        )

        assert result["success"] is True
        assert joined["agent_id"] not in router.sessions[session["session_id"]].agents

    @pytest.mark.asyncio
    async def test_leave_nonexistent_session(self, router):
        """Leaving nonexistent session returns error."""
        result = await router.leave_session(
            session_id="sess_nonexistent",
            agent_id="agent_001"
        )

        assert result["success"] is False
        assert "not_found" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_leave_nonexistent_agent(self, router):
        """Leaving with nonexistent agent returns error."""
        session = await router.create_session(session_name="Test")

        result = await router.leave_session(
            session_id=session["session_id"],
            agent_id="agent_nonexistent"
        )

        assert result["success"] is False
        assert "not_in_session" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_get_session_state(self, router):
        """Can get session state."""
        session = await router.create_session(session_name="Test")
        await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder-A",
            role="builder"
        )

        result = await router.get_session_state(session_id=session["session_id"])

        assert result["success"] is True
        assert len(result["agents"]) == 1
        assert result["agents"][0]["name"] == "Builder-A"
        assert result["agents"][0]["role"] == "builder"

    @pytest.mark.asyncio
    async def test_get_session_state_nonexistent(self, router):
        """Getting nonexistent session returns error."""
        result = await router.get_session_state(session_id="sess_nonexistent")

        assert result["success"] is False
        assert "not_found" in result.get("error", "").lower()

    # === Region Management Tests ===

    @pytest.mark.asyncio
    async def test_claim_region(self, router):
        """Agent can claim a region."""
        session = await router.create_session(session_name="Test")
        joined = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        result = await router.claim_region(
            session_id=session["session_id"],
            agent_id=joined["agent_id"],
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="kernel build"
        )

        assert result["success"] is True
        assert "claim_id" in result
        assert result["bounds"]["x"] == 0
        assert result["bounds"]["width"] == 100

    @pytest.mark.asyncio
    async def test_claim_region_conflict(self, router):
        """Cannot claim overlapping region (exclusive mode)."""
        session = await router.create_session(session_name="Test")
        agent1 = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder1",
            role="builder"
        )
        agent2 = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder2",
            role="builder"
        )

        # Agent1 claims a region
        await router.claim_region(
            session_id=session["session_id"],
            agent_id=agent1["agent_id"],
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="first"
        )

        # Agent2 tries to claim overlapping region
        result = await router.claim_region(
            session_id=session["session_id"],
            agent_id=agent2["agent_id"],
            region={"x": 50, "y": 50, "width": 100, "height": 100},
            purpose="conflict"
        )

        assert result["success"] is False
        assert "conflict" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_claim_region_nonexistent_session(self, router):
        """Cannot claim region in nonexistent session."""
        result = await router.claim_region(
            session_id="sess_nonexistent",
            agent_id="agent_001",
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="test"
        )

        assert result["success"] is False

    @pytest.mark.asyncio
    async def test_release_region(self, router):
        """Agent can release a claimed region."""
        session = await router.create_session(session_name="Test")
        joined = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        claimed = await router.claim_region(
            session_id=session["session_id"],
            agent_id=joined["agent_id"],
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="test"
        )

        result = await router.release_region(
            session_id=session["session_id"],
            claim_id=claimed["claim_id"]
        )

        assert result["success"] is True
        assert claimed["claim_id"] not in router.sessions[session["session_id"]].regions

    @pytest.mark.asyncio
    async def test_release_region_transfer(self, router):
        """Releasing region can transfer to another agent."""
        session = await router.create_session(session_name="Test")
        agent1 = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder1",
            role="builder"
        )
        agent2 = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder2",
            role="builder"
        )

        claimed = await router.claim_region(
            session_id=session["session_id"],
            agent_id=agent1["agent_id"],
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="test"
        )

        result = await router.release_region(
            session_id=session["session_id"],
            claim_id=claimed["claim_id"],
            transfer_to=agent2["agent_id"]
        )

        assert result["success"] is True
        assert result["transferred_to"] == agent2["agent_id"]
        # Region still exists but owned by agent2
        assert claimed["claim_id"] in router.sessions[session["session_id"]].regions

    @pytest.mark.asyncio
    async def test_query_region(self, router):
        """Can query region ownership."""
        session = await router.create_session(session_name="Test")
        agent1 = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder1",
            role="builder"
        )

        await router.claim_region(
            session_id=session["session_id"],
            agent_id=agent1["agent_id"],
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="test"
        )

        result = await router.query_region(
            session_id=session["session_id"],
            region={"x": 50, "y": 50, "width": 50, "height": 50}
        )

        assert result["success"] is True
        assert result["is_free"] is False
        assert len(result["claims"]) == 1

    @pytest.mark.asyncio
    async def test_query_region_free(self, router):
        """Query shows free region as available."""
        session = await router.create_session(session_name="Test")
        agent1 = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder1",
            role="builder"
        )

        # Claim one region
        await router.claim_region(
            session_id=session["session_id"],
            agent_id=agent1["agent_id"],
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="test"
        )

        # Query a different, non-overlapping region
        result = await router.query_region(
            session_id=session["session_id"],
            region={"x": 200, "y": 200, "width": 100, "height": 100}
        )

        assert result["success"] is True
        assert result["is_free"] is True
        assert len(result["claims"]) == 0

    # === Task Delegation Tests ===

    def test_session_task_dataclass(self):
        """SessionTask dataclass exists with required fields."""
        from systems.pixel_compiler.a2a_router import SessionTask
        import time

        task = SessionTask(
            task_id="task_001",
            session_id="sess_001",
            task_type="build",
            description="Build kernel module",
            assigned_to=None,
            status="pending",
            priority="medium",
            created_by="agent_001",
            created_at=time.time()
        )

        assert task.task_id == "task_001"
        assert task.status == "pending"
        assert task.priority == "medium"
        assert task.dependencies == []
        assert task.artifacts == []

    @pytest.mark.asyncio
    async def test_delegate_task(self, router):
        """Architect can delegate a task."""
        session = await router.create_session(session_name="Test")
        architect = await router.join_session(
            session_id=session["session_id"],
            agent_name="Architect",
            role="architect"
        )

        result = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="build",
            description="Build kernel module",
            priority="high"
        )

        assert result["success"] is True
        assert "task_id" in result
        assert result["status"] == "pending"

    @pytest.mark.asyncio
    async def test_delegate_task_with_dependencies(self, router):
        """Task can have dependencies on other tasks."""
        session = await router.create_session(session_name="Test")
        architect = await router.join_session(
            session_id=session["session_id"],
            agent_name="Architect",
            role="architect"
        )

        # Create first task
        task1 = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="build",
            description="First task"
        )

        # Create second task dependent on first
        task2 = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="test",
            description="Test first task",
            dependencies=[task1["task_id"]]
        )

        assert task2["success"] is True
        # Second task should be blocked until first completes
        assert task2.get("blocked_by") == [task1["task_id"]]

    @pytest.mark.asyncio
    async def test_accept_task(self, router):
        """Agent can accept a pending task."""
        session = await router.create_session(session_name="Test")
        architect = await router.join_session(
            session_id=session["session_id"],
            agent_name="Architect",
            role="architect"
        )
        builder = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        task = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="build",
            description="Build module"
        )

        result = await router.accept_task(
            session_id=session["session_id"],
            task_id=task["task_id"],
            agent_id=builder["agent_id"]
        )

        assert result["success"] is True
        assert result["status"] == "in_progress"

    @pytest.mark.asyncio
    async def test_accept_blocked_task_fails(self, router):
        """Cannot accept a blocked task."""
        session = await router.create_session(session_name="Test")
        architect = await router.join_session(
            session_id=session["session_id"],
            agent_name="Architect",
            role="architect"
        )
        builder = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        task1 = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="build",
            description="First"
        )

        task2 = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="test",
            description="Test first",
            dependencies=[task1["task_id"]]
        )

        # Try to accept blocked task
        result = await router.accept_task(
            session_id=session["session_id"],
            task_id=task2["task_id"],
            agent_id=builder["agent_id"]
        )

        assert result["success"] is False
        assert "blocked" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_report_task_completion(self, router):
        """Agent can report task completion."""
        session = await router.create_session(session_name="Test")
        architect = await router.join_session(
            session_id=session["session_id"],
            agent_name="Architect",
            role="architect"
        )
        builder = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        task = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="build",
            description="Build module"
        )
        await router.accept_task(
            session_id=session["session_id"],
            task_id=task["task_id"],
            agent_id=builder["agent_id"]
        )

        result = await router.report_task(
            session_id=session["session_id"],
            task_id=task["task_id"],
            agent_id=builder["agent_id"],
            status="completed",
            result={"tiles_placed": 10}
        )

        assert result["success"] is True
        assert result["status"] == "completed"

    @pytest.mark.asyncio
    async def test_report_unblocks_dependent_tasks(self, router):
        """Completing a task unblocks dependent tasks."""
        session = await router.create_session(session_name="Test")
        architect = await router.join_session(
            session_id=session["session_id"],
            agent_name="Architect",
            role="architect"
        )
        builder = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        task1 = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="build",
            description="First"
        )
        task2 = await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="test",
            description="Test first",
            dependencies=[task1["task_id"]]
        )

        # Verify task2 is blocked
        assert router.sessions[session["session_id"]].tasks[task2["task_id"]].status == "blocked"

        # Accept and complete task1
        await router.accept_task(
            session_id=session["session_id"],
            task_id=task1["task_id"],
            agent_id=builder["agent_id"]
        )
        result = await router.report_task(
            session_id=session["session_id"],
            task_id=task1["task_id"],
            agent_id=builder["agent_id"],
            status="completed"
        )

        # Task2 should now be unblocked
        assert task2["task_id"] in result.get("unblocked_tasks", [])
        assert router.sessions[session["session_id"]].tasks[task2["task_id"]].status == "pending"

    @pytest.mark.asyncio
    async def test_get_task_queue(self, router):
        """Can view task queue."""
        session = await router.create_session(session_name="Test")
        architect = await router.join_session(
            session_id=session["session_id"],
            agent_name="Architect",
            role="architect"
        )

        await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="build",
            description="Task 1",
            priority="high"
        )
        await router.delegate_task(
            session_id=session["session_id"],
            from_agent=architect["agent_id"],
            target_agent_id="any",
            task_type="test",
            description="Task 2",
            priority="low"
        )

        result = await router.get_task_queue(session_id=session["session_id"])

        assert result["success"] is True
        assert len(result["tasks"]) == 2
        assert result["summary"]["pending"] == 2
