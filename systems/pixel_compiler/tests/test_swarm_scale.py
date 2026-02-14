# systems/pixel_compiler/tests/test_swarm_scale.py
"""Scale tests for SwarmManager - 1024 agent capacity."""

import pytest
import time


class TestSwarmScale:
    """Test swarm at scale."""

    def test_spawn_1024_agents(self):
        """Can spawn maximum 1024 agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        start = time.time()
        for i in range(1024):
            manager.spawn_agent(args=[i])
        elapsed = time.time() - start

        assert len(manager.active_agents) == 1024
        print(f"Spawned 1024 agents in {elapsed*1000:.1f}ms")

    def test_dispatch_1024_agents(self):
        """Can dispatch 1024 agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        for _ in range(1024):
            manager.spawn_agent()

        start = time.time()
        result = manager.dispatch()
        elapsed = time.time() - start

        assert len(result.agent_results) == 1024
        print(f"Dispatched 1024 agents in {elapsed*1000:.1f}ms")

    def test_spawn_kill_cycle(self):
        """Can spawn and kill agents repeatedly."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        for cycle in range(10):
            ids = [manager.spawn_agent() for _ in range(100)]
            for aid in ids:
                manager.kill_agent(aid)

        assert len(manager.active_agents) == 0
        # Slots should be recycled
        assert len(manager.free_slots) == 1024

    def test_memory_usage(self):
        """Memory usage is within bounds."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        # Pool: 64MB, Globals: 16KB, Output: 4MB
        expected_pool = 1024 * 64 * 1024
        expected_globals = 1024 * 16 * 4

        assert SwarmManager.MAX_AGENTS * SwarmManager.AGENT_MEMORY_SIZE == expected_pool
