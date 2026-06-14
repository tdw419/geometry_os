"""
Evolution Daemon - AI-driven glyph program evolution.

This module provides evolution primitives for evolving glyph programs
that compile to SPIR-V and execute on GPU.
"""

from .glyph_evolution import (
    GlyphProgram,
    GlyphMutator,
    fitness_shader_correctness,
    evolve_glyph_program,
    VALID_OPCODES,
)

from .compiler_bridge import (
    compile_glyph_program,
    compile_and_score,
    find_compiler,
    CompileResult,
)

__all__ = [
    # glyph_evolution
    "GlyphProgram",
    "GlyphMutator",
    "fitness_shader_correctness",
    "evolve_glyph_program",
    "VALID_OPCODES",
    # compiler_bridge
    "compile_glyph_program",
    "compile_and_score",
    "find_compiler",
    "CompileResult",
]
