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

__all__ = [
    "GlyphProgram",
    "GlyphMutator",
    "fitness_shader_correctness",
    "evolve_glyph_program",
    "VALID_OPCODES",
]
