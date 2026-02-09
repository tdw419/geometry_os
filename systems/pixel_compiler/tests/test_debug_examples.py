#!/usr/bin/env python3
"""
Tests for PixelRTS Visual Debugger examples

Verifies that the example programs in examples/debugging/
work correctly with the GPU executor and produce expected results.
"""
import pytest
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from gpu_executor import GPUExecutor
from vasm import VisualAssembler
import numpy as np


# Helper to get shader path
def get_shader_path():
    """Get path to pixel_vm_debug.wgsl shader"""
    return Path(__file__).parent.parent / "pixel_vm_debug.wgsl"


# Helper to get example path
def get_example_path(name):
    """Get path to example file"""
    # From: systems/pixel_compiler/tests/test_debug_examples.py
    # To: examples/debugging/fibonacci_debug.vasm
    # Need to go up 4 levels: tests -> pixel_compiler -> systems -> geometry_os
    repo_root = Path(__file__).parent.parent.parent.parent
    return repo_root / "examples/debugging" / name


class TestDebugExamples:
    """Test suite for debugger example programs"""

    def test_fibonacci_example_assembles(self):
        """Test that fibonacci example assembles correctly"""
        example_path = get_example_path("fibonacci_debug.vasm")

        if not example_path.exists():
            pytest.skip(f"Example file not found: {example_path}")

        with open(example_path) as f:
            source = f.read()

        assembler = VisualAssembler()
        assembler.compile(source)

        # Should have multiple instructions
        assert len(assembler.instructions) > 10
        assert assembler.pc > 10

    def test_fibonacci_example_executes(self):
        """Test that fibonacci example executes on GPU"""
        pytest.importorskip("wgpu")

        example_path = get_example_path("fibonacci_debug.vasm")

        if not example_path.exists():
            pytest.skip(f"Example file not found: {example_path}")

        with open(example_path) as f:
            source = f.read()

        # Assemble
        assembler = VisualAssembler()
        assembler.compile(source)
        pixels = assembler.encode_to_pixels('code')

        # Execute on GPU
        shader_path = get_shader_path()
        executor = GPUExecutor(str(shader_path))
        executor.load_program(pixels)
        result = executor.run()

        # Fibonacci(10) = 55
        # Allow small floating point error
        assert abs(result.registers[1] - 55.0) < 1.0, \
            f"Expected R1 ≈ 55, got {result.registers[1]}"

        # Should have executed multiple instructions
        assert result.steps > 20, f"Expected >20 steps, got {result.steps}"

    def test_fibonacci_trace_valid(self):
        """Test that fibonacci example produces valid trace"""
        pytest.importorskip("wgpu")

        example_path = get_example_path("fibonacci_debug.vasm")

        if not example_path.exists():
            pytest.skip(f"Example file not found: {example_path}")

        with open(example_path) as f:
            source = f.read()

        assembler = VisualAssembler()
        assembler.compile(source)
        pixels = assembler.encode_to_pixels('code')

        shader_path = get_shader_path()
        executor = GPUExecutor(str(shader_path))
        executor.load_program(pixels)
        result = executor.run()

        # Trace should exist
        assert len(result.trace) > 0

        # Each trace entry should have required fields
        for entry in result.trace[:10]:  # Check first 10
            assert 'pc' in entry
            assert 'opcode' in entry

    def test_fibonacci_heatmap_coverage(self):
        """Test that fibonacci example produces heatmap with coverage"""
        pytest.importorskip("wgpu")

        example_path = get_example_path("fibonacci_debug.vasm")

        if not example_path.exists():
            pytest.skip(f"Example file not found: {example_path}")

        with open(example_path) as f:
            source = f.read()

        assembler = VisualAssembler()
        assembler.compile(source)
        pixels = assembler.encode_to_pixels('code')

        shader_path = get_shader_path()
        executor = GPUExecutor(str(shader_path))
        executor.load_program(pixels)
        result = executor.run()

        # Heatmap should have same spatial dimensions as program
        h, w = pixels.shape[:2]
        assert result.heatmap.shape[:2] == (h, w)

        # Some pixels should have been executed (non-zero)
        executed_pixels = np.count_nonzero(result.heatmap)
        assert executed_pixels > 0, "No pixels executed in heatmap"


class TestManualPrograms:
    """Test hand-written programs for debugger verification"""

    def test_immediate_load_and_return(self):
        """Test LOAD immediate and RET"""
        pytest.importorskip("wgpu")

        source = """
LOAD R0, 42
RET R0
"""

        assembler = VisualAssembler()
        assembler.compile(source)
        pixels = assembler.encode_to_pixels('code')

        shader_path = get_shader_path()
        executor = GPUExecutor(str(shader_path))
        executor.load_program(pixels)
        result = executor.run()

        # Should execute exactly 2 instructions
        assert result.steps == 2
        # R0 should be 42
        assert abs(result.registers[0] - 42.0) < 0.1

    def test_register_arithmetic(self):
        """Test ADD and MOV instructions"""
        pytest.importorskip("wgpu")

        source = """
LOAD R0, 10
LOAD R1, 5
ADD R0, R1
RET R0
"""

        assembler = VisualAssembler()
        assembler.compile(source)
        pixels = assembler.encode_to_pixels('code')

        shader_path = get_shader_path()
        executor = GPUExecutor(str(shader_path))
        executor.load_program(pixels)
        result = executor.run()

        # 10 + 5 = 15
        assert abs(result.registers[0] - 15.0) < 0.1

    def test_loop_counter(self):
        """Test simple loop with counter"""
        pytest.importorskip("wgpu")

        source = """
LOAD R0, 3
LOAD R1, 0
LOAD R2, 1

loop:
    ADD R1, R2
    SUB R0, R2
    JNZ R0, loop

RET R1
"""

        assembler = VisualAssembler()
        assembler.compile(source)
        pixels = assembler.encode_to_pixels('code')

        shader_path = get_shader_path()
        executor = GPUExecutor(str(shader_path))
        executor.load_program(pixels)
        result = executor.run()

        # Loop runs 3 times, so R1 should be 3
        assert abs(result.registers[1] - 3.0) < 0.5


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
