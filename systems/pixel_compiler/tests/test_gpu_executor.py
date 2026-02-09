#!/usr/bin/env python3
"""
Test suite for GPUExecutor (TDD approach)
Tests the core GPU execution pipeline for PixelRTS Visual Debugger
"""
import pytest
import numpy as np
import tempfile
import sys
from pathlib import Path
from dataclasses import dataclass
from typing import List, Optional

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))


# Define test fixtures and helpers
def create_simple_program_pixels() -> np.ndarray:
    """
    Create a simple 2x2 pixel program:
    - (0,0): LOAD R0, 5  -> (10, 0, 0, 5) but shader uses 0x0A for LOAD
    - (0,1): RET R0      -> (211, 0, 0, 0) but shader uses 0xD3 for RET
    Using shader opcodes from pixel_vm_debug.wgsl
    """
    # OP_LOAD = 10, OP_RET = 211
    pixels = np.zeros((2, 2, 4), dtype=np.uint8)
    # LOAD R0, 5 at position (0, 0)
    # Format: R=opcode, G=dest, B=src, A=immediate
    pixels[0, 0] = [10, 0, 0, 5]  # LOAD R0, 5
    # RET R0 at position (0, 1)
    # Format: R=opcode, G=dest_reg (ignored for RET), B=src, A=immediate
    pixels[0, 1] = [211, 0, 0, 0]  # RET
    return pixels


def create_add_program_pixels() -> np.ndarray:
    """
    Create a program that adds two numbers:
    - LOAD R0, 3
    - LOAD R1, 4
    - ADD R0, R1  (R0 = R0 + R1)
    - RET R0
    """
    # OP_LOAD = 10, OP_ADD = 100, OP_RET = 211
    pixels = np.zeros((2, 2, 4), dtype=np.uint8)
    pixels[0, 0] = [10, 0, 0, 3]    # LOAD R0, 3
    pixels[0, 1] = [10, 1, 0, 4]    # LOAD R1, 4
    pixels[1, 0] = [100, 0, 1, 0]   # ADD R0, R1
    pixels[1, 1] = [211, 0, 0, 0]   # RET
    return pixels


@pytest.fixture
def shader_path():
    """Get path to pixel_vm_debug.wgsl shader"""
    return Path(__file__).parent.parent / "pixel_vm_debug.wgsl"


class TestGPUExecutor:
    """Test GPUExecutor functionality"""

    def test_executor_init(self, shader_path):
        """Test that GPUExecutor initializes correctly"""
        # Import here to skip tests if wgpu is not available
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor

        executor = GPUExecutor(str(shader_path))
        assert executor.device is not None
        assert executor.shader_module is not None

    def test_load_simple_program(self, shader_path):
        """Test loading a simple program from pixel array"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor

        executor = GPUExecutor(str(shader_path))
        pixels = create_simple_program_pixels()

        executor.load_program(pixels)

        assert executor.width == 2
        assert executor.height == 2
        assert executor.texture is not None

    def test_execute_simple_program(self, shader_path):
        """Test executing a simple program (LOAD R0, 5; RET R0)"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor, ExecutionResult

        executor = GPUExecutor(str(shader_path))
        pixels = create_simple_program_pixels()
        executor.load_program(pixels)

        result = executor.run()

        # Verify result type
        assert isinstance(result, ExecutionResult)

        # Verify registers - R0 should contain 5.0
        assert result.registers[0] == 5.0, f"Expected R0=5.0, got R0={result.registers[0]}"

        # Verify trace buffer
        assert len(result.trace) > 0, "Trace buffer should not be empty"

        # Verify execution completed
        assert result.completed, "Execution should be marked as completed"

    def test_execute_add_program(self, shader_path):
        """Test executing an addition program"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor, ExecutionResult

        executor = GPUExecutor(str(shader_path))
        pixels = create_add_program_pixels()
        executor.load_program(pixels)

        result = executor.run()

        # R0 should be 3 + 4 = 7
        assert result.registers[0] == 7.0, f"Expected R0=7.0, got R0={result.registers[0]}"
        # R1 should still be 4
        assert result.registers[1] == 4.0, f"Expected R1=4.0, got R1={result.registers[1]}"

    def test_trace_buffer_population(self, shader_path):
        """Test that trace buffer is populated correctly"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor, ExecutionResult

        executor = GPUExecutor(str(shader_path))
        pixels = create_simple_program_pixels()
        executor.load_program(pixels)

        result = executor.run()

        # Trace should contain at least 2 entries (LOAD + RET)
        assert len(result.trace) >= 2, f"Expected at least 2 trace entries, got {len(result.trace)}"

        # First entry should be LOAD instruction at PC=0
        first_entry = result.trace[0]
        assert first_entry['pc'] == 0, f"Expected PC=0, got {first_entry['pc']}"
        assert first_entry['opcode'] == 10, f"Expected opcode=10 (LOAD), got {first_entry['opcode']}"

    def test_heatmap_generation(self, shader_path):
        """Test that heatmap texture is generated correctly"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor, ExecutionResult

        executor = GPUExecutor(str(shader_path))
        pixels = create_simple_program_pixels()
        executor.load_program(pixels)

        result = executor.run()

        # Heatmap should be a 2D array
        assert result.heatmap is not None, "Heatmap should not be None"
        assert result.heatmap.shape == (2, 2, 4), f"Expected heatmap shape (2,2,4), got {result.heatmap.shape}"

        # At least one pixel should have been executed (red channel > 0)
        has_execution = np.any(result.heatmap[:, :, 0] > 0)
        assert has_execution, "Heatmap should show at least one executed instruction"

    def test_multiple_execution_runs(self, shader_path):
        """Test that executor can run multiple times"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor

        executor = GPUExecutor(str(shader_path))
        pixels = create_simple_program_pixels()
        executor.load_program(pixels)

        # Run twice
        result1 = executor.run()
        result2 = executor.run()

        # Both should complete
        assert result1.completed
        assert result2.completed

        # Results should be consistent
        assert result1.registers[0] == result2.registers[0]

    def test_load_from_png(self, shader_path):
        """Test loading program from PNG file"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor

        try:
            from PIL import Image
        except ImportError:
            pytest.skip("PIL not available")

        # Create a temporary PNG file
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = f.name

        try:
            # Create and save simple program
            pixels = create_simple_program_pixels()
            img = Image.fromarray(pixels, 'RGBA')
            img.save(temp_path)

            # Load and execute
            executor = GPUExecutor(str(shader_path))
            executor.load_program_from_png(temp_path)
            result = executor.run()

            assert result.completed
            assert result.registers[0] == 5.0
        finally:
            # Cleanup
            Path(temp_path).unlink(missing_ok=True)

    def test_custom_initial_registers(self, shader_path):
        """Test setting custom initial register values"""
        pytest.importorskip("wgpu")
        from gpu_executor import GPUExecutor

        executor = GPUExecutor(str(shader_path))
        pixels = create_simple_program_pixels()
        executor.load_program(pixels)

        # Set custom initial values
        initial_regs = {1: 42.0, 2: 99.0}
        result = executor.run(initial_registers=initial_regs)

        # R1 and R2 should have custom values
        assert result.registers[1] == 42.0
        assert result.registers[2] == 99.0
        # R0 should be set by the LOAD instruction
        assert result.registers[0] == 5.0

    def test_execution_result_dataclass(self, shader_path):
        """Test ExecutionResult dataclass structure"""
        pytest.importorskip("wgpu")
        from gpu_executor import ExecutionResult

        # Create a mock result
        result = ExecutionResult(
            registers=np.zeros(256, dtype=np.float32),
            trace=[{'pc': 0, 'opcode': 10, 'dest': 0, 'src': 0, 'immediate': 5}],
            heatmap=np.zeros((2, 2, 4), dtype=np.uint8),
            completed=True,
            steps=1
        )

        assert result.registers.shape == (256,)
        assert len(result.trace) == 1
        assert result.heatmap.shape == (2, 2, 4)
        assert result.completed is True
        assert result.steps == 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
