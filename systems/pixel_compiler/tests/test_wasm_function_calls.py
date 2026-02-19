"""
Tests for WASM Function Call Convention (Task 2.2)

Tests the function call API of WASMGPUBridge:
- set_entry_point(function_index: int) - Set function to execute
- set_arguments(args: List[int]) - Pass via globals array
- get_return_value() -> int - Read from globals[0]

Follows TDD approach - tests written before implementation.
"""

import pytest
from typing import List


class TestFunctionCallConvention:
    """Test suite for function call convention methods."""

    def test_set_entry_point_default(self):
        """Test that entry point defaults to 0."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Entry point should default to 0
        assert bridge._entry_point == 0

    def test_set_entry_point(self):
        """Test setting entry point to a function index."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Set entry point to function 5
        bridge.set_entry_point(5)

        assert bridge._entry_point == 5

    def test_set_entry_point_zero(self):
        """Test setting entry point to 0 (first function)."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        bridge.set_entry_point(0)

        assert bridge._entry_point == 0

    def test_set_entry_point_negative(self):
        """Test that negative entry points are accepted (for special cases)."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Negative indices might be used for special purposes
        bridge.set_entry_point(-1)

        assert bridge._entry_point == -1

    def test_set_arguments_empty(self):
        """Test setting empty arguments list."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Set empty arguments
        bridge.set_arguments([])

        assert bridge._arguments == []

    def test_set_arguments_single(self):
        """Test setting a single argument."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Set single argument
        bridge.set_arguments([42])

        assert bridge._arguments == [42]

    def test_set_arguments_multiple(self):
        """Test setting multiple arguments."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Set multiple arguments
        args = [5, 3, 10, 20]
        bridge.set_arguments(args)

        assert bridge._arguments == args

    def test_set_arguments_negative(self):
        """Test setting negative arguments."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Set negative argument
        bridge.set_arguments([-42])

        assert bridge._arguments == [-42]

    def test_set_arguments_overwrites(self):
        """Test that setting arguments overwrites previous values."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Set initial arguments
        bridge.set_arguments([1, 2, 3])
        assert bridge._arguments == [1, 2, 3]

        # Overwrite with new arguments
        bridge.set_arguments([4, 5])
        assert bridge._arguments == [4, 5]

    def test_get_return_value_initially_none(self):
        """Test that get_return_value returns None initially."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Before any execution, return value should be None
        result = bridge.get_return_value()

        assert result is None

    def test_get_return_value_after_execution(self):
        """Test that get_return_value returns the actual return value after execution."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Execute WASM (mock mode returns 42)
        exec_result = bridge.execute(wasm_bytes=b'\x00asm\x01\x00\x00\x00')

        # get_return_value() should return the same value as ExecutionResult.return_value
        returned = bridge.get_return_value()

        assert returned == exec_result.return_value, \
            f"get_return_value() returned {returned}, but expected {exec_result.return_value}"

    def test_entry_point_used_in_execute(self):
        """Test that entry point is used in execute()."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Set entry point
        bridge.set_entry_point(5)

        # Execute - should use entry point 5
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            entry_point=bridge._entry_point
        )

        # Should succeed
        assert result.success

    def test_arguments_used_in_execute(self):
        """Test that arguments are passed through execute()."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Set arguments
        bridge.set_arguments([10, 20])

        # Execute with arguments
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            entry_point=0,
            arguments=bridge._arguments
        )

        # Should succeed
        assert result.success

    def test_full_call_sequence(self):
        """Test the full call sequence: set_entry_point, set_arguments, execute."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Simulate calling function 3 with arguments [5, 7]
        bridge.set_entry_point(3)
        bridge.set_arguments([5, 7])

        # Verify state
        assert bridge._entry_point == 3
        assert bridge._arguments == [5, 7]

        # Execute
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            entry_point=bridge._entry_point,
            arguments=bridge._arguments
        )

        # Should succeed
        assert result.success

    def test_arguments_and_entry_point_independent(self):
        """Test that entry point and arguments are independent."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Set entry point first
        bridge.set_entry_point(10)
        assert bridge._entry_point == 10
        assert bridge._arguments is None

        # Set arguments second
        bridge.set_arguments([1, 2, 3])
        assert bridge._entry_point == 10  # Should not change
        assert bridge._arguments == [1, 2, 3]

        # Change entry point again
        bridge.set_entry_point(20)
        assert bridge._entry_point == 20
        assert bridge._arguments == [1, 2, 3]  # Should not change


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
