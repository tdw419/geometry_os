"""Tests for compiler bridge."""

import pytest
from pathlib import Path
from systems.evolution_daemon.glyph_evolution import GlyphProgram
from systems.evolution_daemon.compiler_bridge import (
    find_compiler,
    compile_glyph_program,
    compile_and_score,
    CompileResult,
)


class TestCompilerBridge:
    """Tests for compiler bridge functions."""

    def test_find_compiler_returns_path_or_none(self):
        """Test that find_compiler returns Path or None."""
        result = find_compiler()
        assert result is None or isinstance(result, Path)

    def test_compile_empty_program(self):
        """Test compiling an empty program."""
        program = GlyphProgram(glyphs=[])
        result = compile_glyph_program(program, timeout=5.0)

        # Should either succeed or fail gracefully
        assert isinstance(result, CompileResult)
        assert isinstance(result.success, bool)

    def test_compile_simple_program(self):
        """Test compiling a simple program."""
        program = GlyphProgram(glyphs=[
            {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},  # MOV
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},  # HALT
        ])
        result = compile_glyph_program(program, timeout=5.0)

        assert isinstance(result, CompileResult)
        # If compiler exists, should succeed
        if result.success:
            assert result.spirv_size > 0

    def test_compile_and_score_returns_tuple(self):
        """Test that compile_and_score returns tuple."""
        program = GlyphProgram(glyphs=[
            {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},
        ])
        result, fitness = compile_and_score(program)

        assert isinstance(result, CompileResult)
        assert isinstance(fitness, float)
        assert 0.0 <= fitness <= 1.0

    def test_compile_result_is_dataclass(self):
        """Test CompileResult is a dataclass."""
        result = CompileResult(
            success=True,
            spirv_size=100,
            word_count=25,
            magic="0x07230203",
            error=None,
        )
        assert result.success is True
        assert result.spirv_size == 100
        assert result.magic == "0x07230203"

    def test_compile_result_failed(self):
        """Test CompileResult for failed compilation."""
        result = CompileResult(
            success=False,
            spirv_size=0,
            word_count=0,
            magic=None,
            error="Compilation failed",
        )
        assert result.success is False
        assert result.error == "Compilation failed"
        assert result.spirv_size == 0

    def test_compile_missing_compiler_returns_error(self):
        """Test that missing compiler returns appropriate error."""
        program = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])
        result = compile_glyph_program(program, compiler_path=Path("/nonexistent/compiler"))

        assert result.success is False
        assert result.error is not None
        assert "glyph_compiler not found" in result.error or "No such file" in result.error

    def test_compile_and_score_with_custom_fitness(self):
        """Test compile_and_score with custom fitness function."""
        program = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])

        def custom_fitness(prog, compile_result):
            return 0.5  # Always return 0.5

        result, fitness = compile_and_score(program, fitness_fn=custom_fitness)

        assert isinstance(result, CompileResult)
        # If compiler not found, fitness should be 0.0
        # If compiler found and success, fitness should be 0.5
        if result.success:
            assert fitness == 0.5
        else:
            assert fitness == 0.0
