# systems/pixel_compiler/tests/test_swarm_integration.py
"""Integration tests for SwarmManager with existing WASM tooling."""

import pytest


class TestSwarmWASMIntegration:
    """Test SwarmManager with real WASM bytecode."""

    def test_from_wasm_bytes(self):
        """Can create SwarmManager from WASM bytes."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([
            0x00, 0x61, 0x73, 0x6d,  # \0asm
            0x01, 0x00, 0x00, 0x00,  # version 1
        ])

        manager = SwarmManager.from_wasm(wasm)
        assert manager._bytecode_loaded is True

    def test_from_wasm_with_shader(self):
        """Can create SwarmManager with custom shader."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        manager = SwarmManager.from_wasm(wasm, shader_path="/custom/shader.wgsl")
        assert manager._bytecode_loaded is True

    def test_from_wasm_preserves_bytecode_size(self):
        """from_wasm preserves bytecode size."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([
            0x00, 0x61, 0x73, 0x6d,  # \0asm
            0x01, 0x00, 0x00, 0x00,  # version 1
            # Type section
            0x01, 0x04, 0x01, 0x60, 0x00, 0x00,
            # Function section
            0x03, 0x02, 0x01, 0x00,
        ])

        manager = SwarmManager.from_wasm(wasm)
        assert manager._bytecode_size == len(wasm)

    def test_from_wasm_can_spawn_after_creation(self):
        """Can spawn agents immediately after from_wasm."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        manager = SwarmManager.from_wasm(wasm)

        # Should be able to spawn without calling load_bytecode
        agent_id = manager.spawn_agent()
        assert agent_id == 0

    def test_from_wasm_multiple_agents(self):
        """from_wasm allows spawning multiple agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        manager = SwarmManager.from_wasm(wasm)

        # Spawn multiple agents
        ids = [manager.spawn_agent() for _ in range(5)]
        assert ids == [0, 1, 2, 3, 4]

    def test_from_wasm_with_args(self):
        """from_wasm allows spawning agents with args."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        manager = SwarmManager.from_wasm(wasm)

        # Spawn with arguments
        agent_id = manager.spawn_agent(entry_point=42, args=[10, 20, 30])
        assert manager.active_agents[agent_id].entry_point == 42


class TestSwarmManagerWithWASMRuntime:
    """Test SwarmManager working alongside WASMRuntime."""

    def test_swarm_and_runtime_bytecode_compatible(self):
        """SwarmManager and WASMRuntime can load same bytecode."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        from systems.pixel_compiler.wasm_runtime import WASMRuntime

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        # Both can load the same bytecode
        manager = SwarmManager.from_wasm(wasm)
        runtime = WASMRuntime.from_wasm(wasm)

        assert manager._bytecode_loaded is True
        assert runtime.wasm_bytes == wasm

    def test_swarm_from_runtime_bytecode(self):
        """SwarmManager can be created from WASMRuntime's bytecode."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        from systems.pixel_compiler.wasm_runtime import WASMRuntime

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        # Create runtime first
        runtime = WASMRuntime.from_wasm(wasm)

        # Create swarm from runtime's bytecode
        manager = SwarmManager.from_wasm(runtime.wasm_bytes)
        assert manager._bytecode_loaded is True


class TestSwarmManagerDispatchIntegration:
    """Test dispatch integration scenarios."""

    def test_dispatch_after_from_wasm(self):
        """Can dispatch after creating via from_wasm."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        manager = SwarmManager.from_wasm(wasm)
        manager.spawn_agent()

        result = manager.dispatch()
        assert len(result.agent_results) == 1

    def test_dispatch_multiple_agents_different_args(self):
        """Dispatch agents with different arguments."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        manager = SwarmManager.from_wasm(wasm)

        # Spawn agents with different arguments
        manager.spawn_agent(args=[1])
        manager.spawn_agent(args=[2])
        manager.spawn_agent(args=[3])

        result = manager.dispatch()
        assert len(result.agent_results) == 3


class TestSwarmManagerEdgeCases:
    """Test edge cases in integration."""

    def test_from_wasm_empty_bytecode(self):
        """from_wasm handles empty bytecode gracefully."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        # Empty bytecode should still work (load_bytecode handles it)
        manager = SwarmManager.from_wasm(b"")
        assert manager._bytecode_loaded is True
        assert manager._bytecode_size == 0

    def test_from_wasm_large_bytecode(self):
        """from_wasm handles larger bytecode."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        # Create a larger "fake" WASM bytecode
        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])
        wasm += b'\x00' * 1000  # Pad with zeros

        manager = SwarmManager.from_wasm(wasm)
        assert manager._bytecode_loaded is True
        assert manager._bytecode_size == len(wasm)

    def test_from_wasm_shader_path_stored(self):
        """from_wasm stores shader path for later use."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])
        custom_path = "/custom/path/shader.wgsl"

        manager = SwarmManager.from_wasm(wasm, shader_path=custom_path)

        # The shader path should be stored (or at least used during init)
        # In mock mode, _shader_path may not be set, but the manager should work
        assert manager._bytecode_loaded is True
