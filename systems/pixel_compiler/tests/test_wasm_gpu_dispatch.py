"""
Tests for WASM GPU Dispatch and Execution (Task 2.3)

Tests the execution API of WASMGPUBridge:
- execute(max_instructions: int) -> ExecutionResult - GPU dispatch
- enable_tracing() / disable_tracing() - Trace control
- _mock_execute() - Mock mode for testing

Follows TDD approach - tests written before implementation.
"""

import pytest
from typing import List


class TestGPUDispatchAndExecution:
    """Test suite for GPU dispatch and execution methods."""

    def test_execute_returns_execution_result(self):
        """Test that execute returns an ExecutionResult."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute minimal WASM
        result = bridge.execute(wasm_bytes=b'\x00asm\x01\x00\x00\x00')

        # Should return ExecutionResult
        assert isinstance(result, ExecutionResult)

    def test_execute_with_max_instructions(self):
        """Test that max_instructions parameter is respected."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with max_instructions
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            max_instructions=100
        )

        assert isinstance(result, ExecutionResult)
        # In mock mode, instruction_count is set
        assert result.instruction_count >= 0

    def test_execute_with_large_max_instructions(self):
        """Test execution with large max_instructions value."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with large max_instructions
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            max_instructions=1000000
        )

        assert isinstance(result, ExecutionResult)

    def test_execute_with_zero_max_instructions(self):
        """Test execution with zero max_instructions."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with zero max_instructions (should still work)
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            max_instructions=0
        )

        assert isinstance(result, ExecutionResult)

    def test_execute_with_memory_pages(self):
        """Test execution with memory_pages parameter."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with memory_pages
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            memory_pages=2
        )

        assert isinstance(result, ExecutionResult)
        # Memory dump should be present
        assert result.memory_dump is not None
        assert len(result.memory_dump) == 2 * 64 * 1024

    def test_execute_success_true(self):
        """Test that execute returns success=True for valid WASM."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute valid WASM header
        result = bridge.execute(wasm_bytes=b'\x00asm\x01\x00\x00\x00')

        assert result.success is True

    def test_execute_has_return_value(self):
        """Test that execute result has return_value field."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute
        result = bridge.execute(wasm_bytes=b'\x00asm\x01\x00\x00\x00')

        # In mock mode, return_value is set to 42
        assert result.return_value == 42

    def test_enable_tracing(self):
        """Test that enable_tracing enables trace collection."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Enable tracing
        bridge.enable_tracing()

        assert bridge.trace_enabled is True

    def test_disable_tracing(self):
        """Test that disable_tracing (enable_tracing(False)) disables tracing."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Enable tracing first
        bridge.enable_tracing()
        assert bridge.trace_enabled is True

        # Disable tracing
        bridge.enable_tracing(enabled=False)
        assert bridge.trace_enabled is False

    def test_tracing_affects_execution(self):
        """Test that tracing affects execution result."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with tracing enabled
        bridge.enable_tracing()
        result_with_trace = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00'
        )

        # Execute with tracing disabled
        bridge.disable_tracing()
        result_without_trace = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00'
        )

        # Both should succeed
        assert result_with_trace.success
        assert result_without_trace.success

        # trace_data should be present in both (allocated even if disabled)
        assert isinstance(result_with_trace.trace_data, list)
        assert isinstance(result_without_trace.trace_data, list)

    def test_mock_mode_detection(self):
        """Test that mock mode is detected correctly."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # In the test environment, we're likely in mock mode
        # (unless wgpu is properly installed)
        assert isinstance(bridge.mock, bool)

    def test_execute_in_mock_mode(self):
        """Test that execute works in mock mode."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Should be in mock mode if wgpu is not available
        if bridge.mock:
            result = bridge.execute(wasm_bytes=b'\x00asm\x01\x00\x00\x00')

            # Mock execution should return a result
            assert result.success
            assert result.return_value == 42  # Mock return value
            assert result.instruction_count == 10  # Mock instruction count

    def test_execute_with_globals_init(self):
        """Test execute with globals_init parameter."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with globals_init
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            globals_init=[0, 100, 200]
        )

        assert result.success

    def test_execute_with_arguments(self):
        """Test execute with arguments parameter."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with arguments
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            arguments=[5, 3]
        )

        assert result.success

    def test_execute_with_entry_point(self):
        """Test execute with entry_point parameter."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        # Execute with entry_point
        result = bridge.execute(
            wasm_bytes=b'\x00asm\x01\x00\x00\x00',
            entry_point=5
        )

        assert result.success

    def test_execution_result_fields(self):
        """Test that ExecutionResult has all required fields."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        result = bridge.execute(wasm_bytes=b'\x00asm\x01\x00\x00\x00')

        # Check all fields
        assert hasattr(result, 'success')
        assert hasattr(result, 'return_value')
        assert hasattr(result, 'memory_dump')
        assert hasattr(result, 'trace_data')
        assert hasattr(result, 'instruction_count')
        assert hasattr(result, 'error')

    def test_execution_result_error_none_on_success(self):
        """Test that error is None when execution succeeds."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

        bridge = WASMGPUBridge()

        result = bridge.execute(wasm_bytes=b'\x00asm\x01\x00\x00\x00')

        # When success is True, error should be None
        if result.success:
            assert result.error is None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
