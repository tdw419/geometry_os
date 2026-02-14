"""Tests for Multi-Agent Demo components.

Tests the ScannerAgent, ProcessorAgent, CoordinatorAgent, and
coordination primitives (locks, barriers, task delegation).
"""

import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock, patch
from datetime import datetime


# ============================================================================
# Mock Agent Classes (simplified Python equivalents of JS demo)
# ============================================================================

class MockLock:
    """Simple mock lock for testing."""

    def __init__(self):
        self._locked = False
        self._owner = None
        self._waiters = []

    async def acquire(self, agent_id, timeout=30):
        """Try to acquire the lock."""
        if self._locked:
            self._waiters.append(agent_id)
            return {"granted": False, "queue_position": len(self._waiters)}
        self._locked = True
        self._owner = agent_id
        return {"granted": True, "owner": agent_id}

    async def release(self, agent_id):
        """Release the lock."""
        if self._owner != agent_id:
            raise ValueError(f"Agent {agent_id} does not own this lock")
        self._locked = False
        self._owner = None
        return True


class MockBarrier:
    """Simple mock barrier for testing."""

    def __init__(self, expected_count):
        self.expected_count = expected_count
        self._arrived = set()
        self._completed = False

    async def enter(self, agent_id):
        """Enter the barrier."""
        if agent_id in self._arrived:
            return {"arrived": True, "completed": False}

        self._arrived.add(agent_id)

        if len(self._arrived) >= self.expected_count:
            self._completed = True
            return {"arrived": True, "completed": True}

        return {"arrived": True, "completed": False}


class MockMessage:
    """Mock message for agent communication."""

    def __init__(self, msg_type, content, from_agent=None, to_agent=None):
        self.type = msg_type
        self.message_type = msg_type
        self.content = content
        self.from_agent = from_agent
        self.fromAgentId = from_agent
        self.to_agent = to_agent
        self.toAgentId = to_agent
        self.timestamp = datetime.now().timestamp()


# ============================================================================
# Test Coordination Primitives
# ============================================================================

class TestCoordinationPrimitives:
    """Test lock and barrier coordination primitives."""

    @pytest.mark.asyncio
    async def test_lock_prevents_concurrent_access(self):
        """Lock ensures only one agent accesses region at a time."""
        lock = MockLock()

        # First agent acquires lock
        result1 = await lock.acquire("scanner-001", timeout=30)
        assert result1["granted"] is True
        assert result1["owner"] == "scanner-001"

        # Second agent is blocked
        result2 = await lock.acquire("scanner-002", timeout=30)
        assert result2["granted"] is False
        assert result2["queue_position"] == 1

    @pytest.mark.asyncio
    async def test_lock_release_allows_next_agent(self):
        """Lock release allows next agent to acquire."""
        lock = MockLock()

        # First agent acquires
        await lock.acquire("scanner-001")

        # Second agent is blocked
        result2 = await lock.acquire("scanner-002")
        assert result2["granted"] is False

        # First agent releases
        await lock.release("scanner-001")

        # Second agent can now acquire
        result3 = await lock.acquire("scanner-002")
        assert result3["granted"] is True

    @pytest.mark.asyncio
    async def test_lock_prevents_unauthorized_release(self):
        """Lock cannot be released by non-owner."""
        lock = MockLock()

        await lock.acquire("scanner-001")

        with pytest.raises(ValueError):
            await lock.release("scanner-002")

    @pytest.mark.asyncio
    async def test_barrier_synchronizes_agents(self):
        """Barrier waits for expected number of agents."""
        barrier = MockBarrier(expected_count=3)

        # First two agents enter but not complete
        result1 = await barrier.enter("agent-001")
        assert result1["arrived"] is True
        assert result1["completed"] is False

        result2 = await barrier.enter("agent-002")
        assert result2["arrived"] is True
        assert result2["completed"] is False

        # Third agent triggers completion
        result3 = await barrier.enter("agent-003")
        assert result3["arrived"] is True
        assert result3["completed"] is True

    @pytest.mark.asyncio
    async def test_barrier_duplicate_entry(self):
        """Barrier handles duplicate entry gracefully."""
        barrier = MockBarrier(expected_count=2)

        result1 = await barrier.enter("agent-001")
        assert result1["arrived"] is True
        assert result1["completed"] is False

        # Same agent enters again
        result2 = await barrier.enter("agent-001")
        assert result2["arrived"] is True
        assert result2["completed"] is False


# Global lock store to simulate distributed locks across agents
_GLOBAL_LOCKS = {}


# ============================================================================
# Test ScannerAgent
# ============================================================================

class MockScannerAgent:
    """Mock ScannerAgent for testing."""

    def __init__(self, agent_id="scanner-001", global_locks=None):
        self.agent_id = agent_id
        self.regions_scanned = 0
        self.tasks_delegated = 0
        self.current_region = None
        self.locks = {}
        self.message_log = []
        # Use shared global locks for distributed simulation
        self._global_locks = global_locks if global_locks is not None else _GLOBAL_LOCKS

    async def acquire_lock(self, lock_id, timeout=30):
        """Acquire a distributed lock."""
        # Check against global locks to simulate distributed environment
        if lock_id in self._global_locks:
            return {"granted": False, "queue_position": 1}
        self._global_locks[lock_id] = {"owner": self.agent_id, "acquired_at": datetime.now()}
        self.locks[lock_id] = {"acquired_at": datetime.now()}
        return {"granted": True}

    async def release_lock(self, lock_id):
        """Release a distributed lock."""
        if lock_id not in self.locks:
            return False
        # Also release from global locks
        if lock_id in self._global_locks:
            del self._global_locks[lock_id]
        del self.locks[lock_id]
        return True

    async def send_direct_message(self, to_agent, msg_type, content):
        """Send message to another agent."""
        self.message_log.append({
            "to": to_agent,
            "type": msg_type,
            "content": content
        })
        self.tasks_delegated += 1
        return True

    async def scan_region(self, x, y, mock_work_time=0.1):
        """Scan a region with lock coordination."""
        lock_id = f"region-{x}-{y}"
        self.current_region = {"x": x, "y": y}

        # Acquire lock
        lock_result = await self.acquire_lock(lock_id)
        if not lock_result["granted"]:
            return {"success": False, "reason": "lock_not_granted"}

        try:
            # Simulate work
            await asyncio.sleep(mock_work_time)

            # Generate scan data
            scan_data = {
                "region_x": x,
                "region_y": y,
                "patterns_detected": 3,
                "confidence": 0.85
            }

            self.regions_scanned += 1
            return {"success": True, "data": scan_data}
        finally:
            await self.release_lock(lock_id)
            self.current_region = None

    def get_status(self):
        """Get scanner status."""
        return {
            "agent_id": self.agent_id,
            "regions_scanned": self.regions_scanned,
            "tasks_delegated": self.tasks_delegated,
            "current_region": self.current_region,
            "locks_held": list(self.locks.keys())
        }


class TestScannerAgent:
    """Test ScannerAgent initialization and region scanning."""

    @pytest.mark.asyncio
    async def test_scanner_initialization(self):
        """Scanner agent initializes correctly."""
        scanner = MockScannerAgent("scanner-001")

        status = scanner.get_status()
        assert status["agent_id"] == "scanner-001"
        assert status["regions_scanned"] == 0
        assert status["tasks_delegated"] == 0
        assert status["current_region"] is None
        assert len(status["locks_held"]) == 0

    @pytest.mark.asyncio
    async def test_scanner_acquires_lock_for_region(self):
        """Scanner acquires lock before scanning region."""
        scanner = MockScannerAgent()

        # Scan region 0,0
        result = await scanner.scan_region(0, 0, mock_work_time=0)

        assert result["success"] is True
        assert scanner.regions_scanned == 1
        assert "region-0-0" not in scanner.locks  # Lock released

    @pytest.mark.asyncio
    async def test_scanner_blocks_on_locked_region(self):
        """Scanner blocks when region is already locked."""
        global_locks = {}
        scanner1 = MockScannerAgent("scanner-001", global_locks)
        scanner2 = MockScannerAgent("scanner-002", global_locks)

        # Scanner1 acquires lock
        await scanner1.acquire_lock("region-1-1")

        # Scanner2 tries to scan same region
        result = await scanner2.scan_region(1, 1, mock_work_time=0)

        assert result["success"] is False
        assert result["reason"] == "lock_not_granted"

    @pytest.mark.asyncio
    async def test_scanner_delegates_processing(self):
        """Scanner delegates processing task to processor."""
        scanner = MockScannerAgent()

        await scanner.send_direct_message(
            "processor-001",
            "process_request",
            {"type": "scan_results", "data": {"region_x": 0, "region_y": 0}}
        )

        assert scanner.tasks_delegated == 1
        assert len(scanner.message_log) == 1
        assert scanner.message_log[0]["to"] == "processor-001"

    @pytest.mark.asyncio
    async def test_scanner_releases_lock_after_scan(self):
        """Scanner releases lock after scanning completes."""
        scanner = MockScannerAgent()

        await scanner.scan_region(2, 3, mock_work_time=0)

        assert "region-2-3" not in scanner.locks
        assert scanner.current_region is None


# ============================================================================
# Test ProcessorAgent
# ============================================================================

class MockProcessorAgent:
    """Mock ProcessorAgent for testing."""

    def __init__(self, agent_id="processor-001"):
        self.agent_id = agent_id
        self.regions_processed = 0
        self.tasks_received = 0
        self.tasks_completed = 0
        self.pending_tasks = []
        self.is_processing = False
        self.message_log = []

    async def handle_process_request(self, from_agent, content):
        """Handle process request from another agent."""
        self.tasks_received += 1

        task = {
            "id": f"task_{self.tasks_received}",
            "from_agent": from_agent,
            "content": content,
            "queued_at": datetime.now()
        }
        self.pending_tasks.append(task)
        return task

    async def process_next_task(self, mock_work_time=0.1):
        """Process next task in queue."""
        if not self.pending_tasks:
            self.is_processing = False
            return {"success": False, "reason": "no_tasks"}

        self.is_processing = True
        task = self.pending_tasks.pop(0)

        # Simulate work
        await asyncio.sleep(mock_work_time)

        # Generate analysis result
        result = {
            "task_id": task["id"],
            "analysis_type": "spatial",
            "patterns": [{"type": "linear", "strength": 0.8}],
            "metrics": {"complexity": 0.65, "density": 0.45},
            "confidence": 0.92
        }

        self.tasks_completed += 1
        self.regions_processed += 1
        self.is_processing = False

        return {"success": True, "result": result}

    def get_status(self):
        """Get processor status."""
        return {
            "agent_id": self.agent_id,
            "regions_processed": self.regions_processed,
            "tasks_received": self.tasks_received,
            "tasks_completed": self.tasks_completed,
            "pending_tasks": len(self.pending_tasks),
            "is_processing": self.is_processing
        }


class TestProcessorAgent:
    """Test ProcessorAgent task queue handling."""

    @pytest.mark.asyncio
    async def test_processor_initialization(self):
        """Processor agent initializes correctly."""
        processor = MockProcessorAgent("processor-001")

        status = processor.get_status()
        assert status["agent_id"] == "processor-001"
        assert status["regions_processed"] == 0
        assert status["tasks_received"] == 0
        assert status["pending_tasks"] == 0
        assert status["is_processing"] is False

    @pytest.mark.asyncio
    async def test_processor_queues_tasks(self):
        """Processor queues incoming tasks."""
        processor = MockProcessorAgent()

        await processor.handle_process_request(
            "scanner-001",
            {"type": "scan_results", "data": {"region_x": 0, "region_y": 0}}
        )

        await processor.handle_process_request(
            "scanner-001",
            {"type": "scan_results", "data": {"region_x": 1, "region_y": 0}}
        )

        status = processor.get_status()
        assert status["tasks_received"] == 2
        assert status["pending_tasks"] == 2

    @pytest.mark.asyncio
    async def test_processor_processes_task(self):
        """Processor processes task from queue."""
        processor = MockProcessorAgent()

        # Add task
        await processor.handle_process_request(
            "scanner-001",
            {"type": "scan_results", "data": {"region_x": 0, "region_y": 0}}
        )

        # Process task
        result = await processor.process_next_task(mock_work_time=0)

        assert result["success"] is True
        assert result["result"]["task_id"] == "task_1"
        assert result["result"]["confidence"] == 0.92

        status = processor.get_status()
        assert status["tasks_completed"] == 1
        assert status["regions_processed"] == 1

    @pytest.mark.asyncio
    async def test_processor_handles_empty_queue(self):
        """Processor handles empty queue gracefully."""
        processor = MockProcessorAgent()

        result = await processor.process_next_task(mock_work_time=0)

        assert result["success"] is False
        assert result["reason"] == "no_tasks"
        status = processor.get_status()
        assert status["is_processing"] is False

    @pytest.mark.asyncio
    async def test_processor_processes_fifo(self):
        """Processor processes tasks in FIFO order."""
        processor = MockProcessorAgent()

        # Add tasks in specific order
        await processor.handle_process_request("scanner-001", {"data": "first"})
        await processor.handle_process_request("scanner-001", {"data": "second"})
        await processor.handle_process_request("scanner-001", {"data": "third"})

        # Process in order
        result1 = await processor.process_next_task(mock_work_time=0)
        result2 = await processor.process_next_task(mock_work_time=0)
        result3 = await processor.process_next_task(mock_work_time=0)

        assert result1["result"]["task_id"] == "task_1"
        assert result2["result"]["task_id"] == "task_2"
        assert result3["result"]["task_id"] == "task_3"


# ============================================================================
# Test CoordinatorAgent
# ============================================================================

class MockCoordinatorAgent:
    """Mock CoordinatorAgent for testing."""

    def __init__(self, grid_width=5, grid_height=5):
        self.agent_id = "coordinator-001"
        self.grid_width = grid_width
        self.grid_height = grid_height
        self.tasks_assigned = 0
        self.barriers_reached = 0
        self.current_phase = 1
        self.pending_regions = []
        self.completed_regions = []
        self.all_regions = []
        self.message_log = []

        # Initialize regions
        for y in range(grid_height):
            for x in range(grid_width):
                self.all_regions.append({"x": x, "y": y, "status": "pending"})
                self.pending_regions.append({"x": x, "y": y})

    async def assign_scan_task(self, x, y):
        """Assign scan task to scanner agent."""
        self.tasks_assigned += 1
        self.message_log.append({
            "to": "scanner-001",
            "action": "scan",
            "region": {"x": x, "y": y}
        })
        return True

    async def assign_process_task(self, x, y, scan_data):
        """Assign process task to processor agent."""
        self.tasks_assigned += 1
        self.message_log.append({
            "to": "processor-001",
            "action": "process",
            "region": {"x": x, "y": y}
        })
        return True

    def handle_scan_complete(self, x, y, data=None):
        """Handle scan completion."""
        # Remove from pending
        pending_idx = next(
            (i for i, r in enumerate(self.pending_regions) if r["x"] == x and r["y"] == y),
            None
        )
        if pending_idx is not None:
            self.pending_regions.pop(pending_idx)
            self.completed_regions.append({"x": x, "y": y, "phase": 1, "data": data})

    def handle_process_complete(self, x, y, result=None):
        """Handle process completion."""
        region = next(
            (r for r in self.all_regions if r["x"] == x and r["y"] == y),
            None
        )
        if region:
            region["status"] = "processed"
            region["result"] = result

    def get_progress(self):
        """Get current progress."""
        total = len(self.all_regions)
        completed = len(self.completed_regions)
        pending = len(self.pending_regions)
        percent = round((completed / total) * 100) if total > 0 else 0

        return {
            "total": total,
            "completed": completed,
            "pending": pending,
            "percent": percent,
            "phase": self.current_phase,
            "tasks_assigned": self.tasks_assigned
        }

    async def start_phase1(self):
        """Start Phase 1: Assign scan tasks."""
        for region in self.pending_regions[:]:
            await self.assign_scan_task(region["x"], region["y"])

    async def start_phase2(self):
        """Start Phase 2: Assign process tasks."""
        self.current_phase = 2
        for region in self.completed_regions:
            await self.assign_process_task(region["x"], region["y"], region.get("data"))

    def reset(self):
        """Reset coordinator state."""
        self.tasks_assigned = 0
        self.barriers_reached = 0
        self.current_phase = 1
        self.pending_regions = []
        self.completed_regions = []
        self.all_regions = []

        for y in range(self.grid_height):
            for x in range(self.grid_width):
                self.all_regions.append({"x": x, "y": y, "status": "pending"})
                self.pending_regions.append({"x": x, "y": y})


class TestCoordinatorAgent:
    """Test CoordinatorAgent progress tracking and task assignment."""

    def test_coordinator_initialization(self):
        """Coordinator initializes with grid regions."""
        coordinator = MockCoordinatorAgent(grid_width=5, grid_height=5)

        progress = coordinator.get_progress()
        assert progress["total"] == 25  # 5x5 grid
        assert progress["completed"] == 0
        assert progress["pending"] == 25
        assert progress["percent"] == 0
        assert progress["phase"] == 1

    @pytest.mark.asyncio
    async def test_coordinator_assigns_scan_tasks(self):
        """Coordinator assigns scan tasks in Phase 1."""
        coordinator = MockCoordinatorAgent(grid_width=3, grid_height=3)

        await coordinator.start_phase1()

        progress = coordinator.get_progress()
        assert progress["tasks_assigned"] == 9  # 3x3 grid
        assert len(coordinator.message_log) == 9

    @pytest.mark.asyncio
    async def test_coordinator_tracks_progress(self):
        """Coordinator tracks completion progress."""
        coordinator = MockCoordinatorAgent(grid_width=5, grid_height=5)

        # Complete 5 regions
        for i in range(5):
            coordinator.handle_scan_complete(i % 5, i // 5)

        progress = coordinator.get_progress()
        assert progress["completed"] == 5
        assert progress["pending"] == 20
        assert progress["percent"] == 20

    @pytest.mark.asyncio
    async def test_coordinator_phase2_transition(self):
        """Coordinator transitions to Phase 2 after scans complete."""
        coordinator = MockCoordinatorAgent(grid_width=3, grid_height=3)

        # Complete all scans
        for region in coordinator.pending_regions[:]:
            coordinator.handle_scan_complete(region["x"], region["y"])

        # Start Phase 2
        await coordinator.start_phase2()

        progress = coordinator.get_progress()
        assert progress["phase"] == 2
        assert progress["tasks_assigned"] == 9  # Process tasks

    @pytest.mark.asyncio
    async def test_coordinator_reset(self):
        """Coordinator resets to initial state."""
        coordinator = MockCoordinatorAgent(grid_width=3, grid_height=3)

        # Modify state
        await coordinator.start_phase1()
        coordinator.handle_scan_complete(0, 0)
        coordinator.handle_scan_complete(1, 0)

        # Reset
        coordinator.reset()

        progress = coordinator.get_progress()
        assert progress["total"] == 9
        assert progress["completed"] == 0
        assert progress["pending"] == 9
        assert progress["tasks_assigned"] == 0
        assert progress["phase"] == 1


# ============================================================================
# Test Demo Workflow
# ============================================================================

class TestDemoWorkflow:
    """Test full workflow phases and metrics aggregation."""

    @pytest.mark.asyncio
    async def test_full_scan_phase_workflow(self):
        """Test complete scan phase from assignment to completion."""
        coordinator = MockCoordinatorAgent(grid_width=3, grid_height=3)
        scanner = MockScannerAgent()

        # Phase 1: Assign all scan tasks
        await coordinator.start_phase1()
        assert coordinator.tasks_assigned == 9

        # Simulate scanner completing all regions
        for region in coordinator.all_regions:
            result = await scanner.scan_region(region["x"], region["y"], mock_work_time=0)
            assert result["success"] is True
            coordinator.handle_scan_complete(region["x"], region["y"])

        # Verify completion
        progress = coordinator.get_progress()
        assert progress["completed"] == 9
        assert progress["percent"] == 100
        assert scanner.regions_scanned == 9

    @pytest.mark.asyncio
    async def test_multi_agent_delegation_workflow(self):
        """Test scanner delegating to processor."""
        scanner = MockScannerAgent()
        processor = MockProcessorAgent()

        # Scanner scans and delegates
        scan_result = await scanner.scan_region(0, 0, mock_work_time=0)
        assert scan_result["success"] is True

        # Delegate to processor
        await scanner.send_direct_message(
            "processor-001",
            "process_request",
            {"type": "scan_results", "data": scan_result["data"]}
        )

        # Processor receives and processes
        await processor.handle_process_request(
            "scanner-001",
            scan_result["data"]
        )

        process_result = await processor.process_next_task(mock_work_time=0)
        assert process_result["success"] is True

        # Verify metrics
        assert scanner.tasks_delegated == 1
        assert processor.tasks_completed == 1
        assert processor.regions_processed == 1

    @pytest.mark.asyncio
    async def test_metrics_aggregation(self):
        """Test metrics aggregation across all agents."""
        coordinator = MockCoordinatorAgent(grid_width=3, grid_height=3)
        scanner = MockScannerAgent()
        processor = MockProcessorAgent()

        # Run partial workflow
        await coordinator.start_phase1()

        # Complete 3 regions
        regions_to_scan = coordinator.all_regions[:3]
        for region in regions_to_scan:
            await scanner.scan_region(region["x"], region["y"], mock_work_time=0)
            coordinator.handle_scan_complete(region["x"], region["y"])

        # Aggregate metrics
        metrics = {
            "coordinator": coordinator.get_progress(),
            "scanner": scanner.get_status(),
            "processor": processor.get_status()
        }

        assert metrics["coordinator"]["completed"] == 3
        assert metrics["scanner"]["regions_scanned"] == 3
        assert metrics["processor"]["regions_processed"] == 0

    @pytest.mark.asyncio
    async def test_workflow_lock_contention(self):
        """Test workflow handles lock contention correctly."""
        global_locks = {}
        scanner1 = MockScannerAgent("scanner-001", global_locks)
        scanner2 = MockScannerAgent("scanner-002", global_locks)

        # Scanner1 acquires lock but doesn't release (simulate holding lock)
        lock_id = "region-0-0"
        lock_result1 = await scanner1.acquire_lock(lock_id)
        assert lock_result1["granted"] is True

        # Scanner2 tries same region (should be blocked by lock)
        lock_result2 = await scanner2.acquire_lock(lock_id)
        assert lock_result2["granted"] is False

        # Scanner2 can still scan different region (different lock)
        result3 = await scanner2.scan_region(0, 1, mock_work_time=0)
        assert result3["success"] is True

        # Cleanup
        await scanner1.release_lock(lock_id)

    @pytest.mark.asyncio
    async def test_full_workflow_with_processor(self):
        """Test end-to-end workflow with all agents."""
        coordinator = MockCoordinatorAgent(grid_width=2, grid_height=2)
        scanner = MockScannerAgent()
        processor = MockProcessorAgent()

        # Phase 1: Scanning
        for region in coordinator.all_regions:
            scan_result = await scanner.scan_region(region["x"], region["y"], mock_work_time=0)
            coordinator.handle_scan_complete(region["x"], region["y"])

        # Phase 2: Processing
        await coordinator.start_phase2()
        for region in coordinator.all_regions:
            await processor.handle_process_request(
                "scanner-001",
                {"region_x": region["x"], "region_y": region["y"]}
            )
            await processor.process_next_task(mock_work_time=0)
            coordinator.handle_process_complete(region["x"], region["y"])

        # Verify final state
        progress = coordinator.get_progress()
        assert progress["completed"] == 4
        assert progress["percent"] == 100
        assert scanner.regions_scanned == 4
        assert processor.regions_processed == 4


# ============================================================================
# Test Edge Cases
# ============================================================================

class TestEdgeCases:
    """Test edge cases and error conditions."""

    @pytest.mark.asyncio
    async def test_empty_grid_workflow(self):
        """Test workflow with empty grid."""
        coordinator = MockCoordinatorAgent(grid_width=0, grid_height=0)

        progress = coordinator.get_progress()
        assert progress["total"] == 0
        assert progress["percent"] == 0

    @pytest.mark.asyncio
    async def test_single_region_workflow(self):
        """Test workflow with single region."""
        coordinator = MockCoordinatorAgent(grid_width=1, grid_height=1)
        scanner = MockScannerAgent()

        # Scan the only region
        result = await scanner.scan_region(0, 0, mock_work_time=0)
        assert result["success"] is True
        coordinator.handle_scan_complete(0, 0)

        progress = coordinator.get_progress()
        assert progress["percent"] == 100

    @pytest.mark.asyncio
    async def test_processor_empty_queue_status(self):
        """Test processor status with empty queue."""
        processor = MockProcessorAgent()

        status = processor.get_status()
        assert status["pending_tasks"] == 0
        assert status["is_processing"] is False

    @pytest.mark.asyncio
    async def test_concurrent_region_scanning(self):
        """Test concurrent scanning of different regions."""
        scanner = MockScannerAgent()

        # Scan multiple regions concurrently
        tasks = [
            scanner.scan_region(0, 0, mock_work_time=0.01),
            scanner.scan_region(1, 0, mock_work_time=0.01),
            scanner.scan_region(2, 0, mock_work_time=0.01)
        ]

        results = await asyncio.gather(*tasks)

        assert all(r["success"] for r in results)
        assert scanner.regions_scanned == 3
