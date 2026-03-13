"""
Evolution Daemon - Self-healing evolution pipeline system.

This module provides hooks and infrastructure for monitoring and
reacting to evolution pipeline events.
"""

from .hooks import (
    AsciiEmitterHook,
    CallbackEvolutionHook,
    EvolutionHook,
    EvolutionHookBroadcaster,
    LoggingEvolutionHook,
    PipelineStage,
    PipelineStatus,
    get_evolution_broadcaster,
)
from .glyph_evolution import (
    GlyphProgram,
    GlyphMutator,
    fitness_shader_correctness,
    evolve_glyph_program,
    VALID_OPCODES,
)

__all__ = [
    "EvolutionHook",
    "EvolutionHookBroadcaster",
    "LoggingEvolutionHook",
    "CallbackEvolutionHook",
    "AsciiEmitterHook",
    "PipelineStage",
    "PipelineStatus",
    "get_evolution_broadcaster",
    # Glyph evolution
    "GlyphProgram",
    "GlyphMutator",
    "fitness_shader_correctness",
    "evolve_glyph_program",
    "VALID_OPCODES",
]
