"""Evolution Daemon Hooks - Extensible hook system for evolution targets."""

from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import (
    BrainEvolutionHook,
    register_hook,
)

__all__ = ["BrainEvolutionHook", "register_hook"]

