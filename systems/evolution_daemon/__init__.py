"""
Evolution Daemon - Self-healing evolution pipeline system.

This module provides hooks and infrastructure for monitoring and
reacting to evolution pipeline events.
"""

from .hooks import (
    EvolutionHook,
    EvolutionHookBroadcaster,
    LoggingEvolutionHook,
    CallbackEvolutionHook,
    AsciiEmitterHook,
    PipelineStage,
    PipelineStatus,
    get_evolution_broadcaster,
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
]
