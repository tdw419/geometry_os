# systems/pixel_compiler/tests/test_swarm_manager.py
"""Tests for SwarmManager - parallel WASM agent execution."""

import pytest
import numpy as np


class TestSwarmManagerInit:
    """Test SwarmManager initialization."""

    def test_import_swarm_manager(self):
        """SwarmManager can be imported."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        assert SwarmManager is not None

    def test_swarm_manager_instantiation(self):
        """SwarmManager can be instantiated."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        assert manager is not None

    def test_swarm_manager_constants(self):
        """SwarmManager has correct constants."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        assert SwarmManager.MAX_AGENTS == 1024
        assert SwarmManager.AGENT_MEMORY_SIZE == 64 * 1024  # 64KB
        assert SwarmManager.GLOBALS_PER_AGENT == 16


class TestSwarmManagerBytecode:
    """Test bytecode loading."""

    def test_load_bytecode_mock_mode(self):
        """Bytecode can be loaded in mock mode."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        # Force mock mode for this test
        manager.mock = True
        manager._mock_bytecode = b""

        wasm = b'\x00asm\x01\x00\x00\x00'  # Minimal WASM header
        manager.load_bytecode(wasm)
        assert manager._bytecode_loaded is True

    def test_load_bytecode_size_tracked(self):
        """Bytecode size is tracked after loading."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        wasm = b'\x00asm' + b'\x00' * 100
        manager.load_bytecode(wasm)
        assert manager._bytecode_size == len(wasm)


class TestSwarmManagerSpawn:
    """Test agent spawning."""

    def test_spawn_single_agent(self):
        """Can spawn a single agent."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        agent_id = manager.spawn_agent()
        assert agent_id == 0
        assert len(manager.active_agents) == 1

    def test_spawn_multiple_agents(self):
        """Can spawn multiple agents with sequential IDs."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        ids = [manager.spawn_agent() for _ in range(5)]
        assert ids == [0, 1, 2, 3, 4]
        assert len(manager.active_agents) == 5

    def test_spawn_with_entry_point(self):
        """Agent can be spawned with custom entry point."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent(entry_point=42)
        assert manager.active_agents[agent_id].entry_point == 42

    def test_spawn_with_args(self):
        """Agent can be spawned with arguments."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent(args=[10, 20, 30])
        # Arguments stored in globals[1], globals[2], globals[3]
        assert agent_id is not None

    def test_spawn_exceeds_capacity(self):
        """Error when exceeding MAX_AGENTS."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        # Spawn max agents
        for _ in range(SwarmManager.MAX_AGENTS):
            manager.spawn_agent()

        # Next spawn should fail
        with pytest.raises(RuntimeError, match="capacity"):
            manager.spawn_agent()

    def test_spawn_requires_bytecode(self):
        """Spawn fails if bytecode not loaded."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        with pytest.raises(RuntimeError, match="bytecode"):
            manager.spawn_agent()


class TestSwarmManagerKill:
    """Test agent removal."""

    def test_kill_agent(self):
        """Can kill an agent and free its slot."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent()
        assert len(manager.active_agents) == 1

        manager.kill_agent(agent_id)
        assert len(manager.active_agents) == 0
        assert agent_id not in manager.active_agents

    def test_kill_frees_slot(self):
        """Killing agent frees its slot for reuse."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        # Spawn and kill
        agent_id = manager.spawn_agent()
        slot = manager.active_agents[agent_id].pool_slot
        manager.kill_agent(agent_id)

        # Spawn again - should reuse slot
        new_id = manager.spawn_agent()
        assert manager.active_agents[new_id].pool_slot == slot

    def test_kill_nonexistent_raises(self):
        """Killing nonexistent agent raises error."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        with pytest.raises(KeyError):
            manager.kill_agent(999)


class TestSwarmManagerMemory:
    """Test agent memory access."""

    def test_set_agent_memory(self):
        """Can set agent memory."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent()
        test_data = b'Hello, World!' + b'\x00' * 50

        manager.set_agent_memory(agent_id, test_data)

        # Verify memory was written by reading it back
        result = manager.get_agent_memory(agent_id, len(test_data))
        assert result[:len(test_data)] == test_data

    def test_get_agent_memory_full(self):
        """Can read full 64KB memory."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent()
        memory = manager.get_agent_memory(agent_id)

        assert len(memory) == SwarmManager.AGENT_MEMORY_SIZE  # 64KB

    def test_memory_isolation(self):
        """Agents have isolated memory."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent1 = manager.spawn_agent()
        agent2 = manager.spawn_agent()

        # Write different data to each agent
        manager.set_agent_memory(agent1, b'AAAA')
        manager.set_agent_memory(agent2, b'BBBB')

        # Verify isolation
        mem1 = manager.get_agent_memory(agent1, 4)
        mem2 = manager.get_agent_memory(agent2, 4)

        assert mem1 == b'AAAA'
        assert mem2 == b'BBBB'

    def test_memory_nonexistent_agent(self):
        """Memory access on nonexistent agent raises."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        with pytest.raises(KeyError, match="Agent .* not found"):
            manager.get_agent_memory(999)

        with pytest.raises(KeyError, match="Agent .* not found"):
            manager.set_agent_memory(999, b'data')


class TestSwarmManagerDispatch:
    """Test agent dispatch."""

    def test_dispatch_returns_result(self):
        """Dispatch returns SwarmResult."""
        from systems.pixel_compiler.swarm_manager import SwarmManager, SwarmResult
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        manager.spawn_agent()
        result = manager.dispatch()

        assert isinstance(result, SwarmResult)

    def test_dispatch_all_active(self):
        """Dispatch runs all active agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        for _ in range(10):
            manager.spawn_agent()

        result = manager.dispatch()
        assert len(result.agent_results) == 10

    def test_dispatch_subset(self):
        """Dispatch can run subset of agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        ids = [manager.spawn_agent() for _ in range(5)]

        # Dispatch only first 2
        result = manager.dispatch(agent_ids=ids[:2])
        assert len(result.agent_results) == 2
        assert set(result.agent_results.keys()) == set(ids[:2])

    def test_dispatch_empty_swarm(self):
        """Dispatch on empty swarm returns empty result."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        result = manager.dispatch()
        assert len(result.agent_results) == 0
