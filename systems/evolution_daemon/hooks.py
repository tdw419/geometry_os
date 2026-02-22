"""
EvolutionHook - Abstract hook trait and broadcaster for Evolution Daemon events.

This module provides an abstract base class for handling evolution pipeline events
and a broadcaster that dispatches events to all registered hooks.

Based on the RiscvHook pattern from systems/infinite_map_rs/src/riscv/hooks.rs

Part of ASCII Scene Graph expansion for zero-cost AI perception.
Enables PAS monitoring and self-correction logging for the Ouroboros self-healing loop.
"""

from abc import ABC, abstractmethod
from typing import List, Optional, Literal
from enum import Enum
import asyncio
import logging

logger = logging.getLogger(__name__)


class PipelineStage(str, Enum):
    """Evolution pipeline stages for hook events."""
    SCAN = "Scan"
    REASON = "Reason"
    PATCH = "Patch"
    BUILD = "Build"


class PipelineStatus(str, Enum):
    """Status values for pipeline stage events."""
    STARTED = "started"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    FAILED = "failed"


class EvolutionHook(ABC):
    """
    Abstract base class for Evolution Daemon event hooks.

    Implement this trait to receive callbacks for PAS score changes,
    pipeline stage transitions, and self-correction events.

    All methods are abstract and must be implemented by subclasses.

    Example:
        >>> class LoggingHook(EvolutionHook):
        ...     def on_pas_change(self, old, new):
        ...         print(f"PAS changed: {old:.2f} -> {new:.2f}")
        ...     def on_pipeline_stage(self, stage, status):
        ...         print(f"Pipeline: {stage} is {status}")
        ...     def on_self_correction(self, trigger, action, result):
        ...         print(f"Correction: {trigger} -> {action} = {result}")
        ...
        >>> broadcaster = EvolutionHookBroadcaster()
        >>> broadcaster.add_hook(LoggingHook())
    """

    @abstractmethod
    def on_pas_change(
        self,
        old_score: float,
        new_score: float
    ) -> None:
        """
        Called when the Predictive Agent Stability (PAS) score changes.

        Args:
            old_score: Previous PAS score (0.0 to 1.0)
            new_score: New PAS score (0.0 to 1.0)
        """
        pass

    @abstractmethod
    def on_pipeline_stage(
        self,
        stage: str,
        status: str
    ) -> None:
        """
        Called when a pipeline stage transitions.

        Args:
            stage: One of "Scan", "Reason", "Patch", "Build"
            status: One of "started", "in_progress", "completed", "failed"
        """
        pass

    @abstractmethod
    def on_self_correction(
        self,
        trigger: str,
        action: str,
        result: bool
    ) -> None:
        """
        Called when a self-correction event occurs.

        Args:
            trigger: What triggered the correction (e.g., "test_failure", "mutation_breach")
            action: The corrective action taken
            result: True if correction succeeded, False otherwise
        """
        pass


class EvolutionHookBroadcaster(EvolutionHook):
    """
    Broadcasts Evolution Daemon events to multiple registered hooks.

    This class implements the EvolutionHook interface and dispatches
    all events to registered hooks. Uses async dispatch for non-blocking
    operation.

    Example:
        >>> broadcaster = EvolutionHookBroadcaster()
        >>> broadcaster.add_hook(MyHook())
        >>> broadcaster.add_hook(AnotherHook())
        >>> # Events are broadcast to all hooks
        >>> broadcaster.on_pas_change(0.8, 0.9)

    Attributes:
        hooks: List of registered EvolutionHook instances
    """

    def __init__(self):
        """Initialize the broadcaster with an empty hook list."""
        self._hooks: List[EvolutionHook] = []
        self._loop: Optional[asyncio.AbstractEventLoop] = None

    @property
    def hooks(self) -> List[EvolutionHook]:
        """Get the list of registered hooks."""
        return self._hooks.copy()

    def add_hook(self, hook: EvolutionHook) -> None:
        """
        Register a hook to receive events.

        Args:
            hook: EvolutionHook instance to register
        """
        if hook not in self._hooks:
            self._hooks.append(hook)
            logger.debug(f"Registered EvolutionHook: {hook.__class__.__name__}")

    def remove_hook(self, hook: EvolutionHook) -> bool:
        """
        Unregister a hook from receiving events.

        Args:
            hook: EvolutionHook instance to remove

        Returns:
            True if the hook was found and removed, False otherwise
        """
        try:
            self._hooks.remove(hook)
            logger.debug(f"Unregistered EvolutionHook: {hook.__class__.__name__}")
            return True
        except ValueError:
            return False

    def clear_hooks(self) -> None:
        """Remove all registered hooks."""
        self._hooks.clear()
        logger.debug("Cleared all EvolutionHooks")

    def _dispatch_async(self, coro) -> None:
        """
        Dispatch a coroutine asynchronously.

        Creates a task if an event loop is available, otherwise logs a warning.

        Args:
            coro: Coroutine to dispatch
        """
        try:
            loop = asyncio.get_running_loop()
            loop.create_task(coro)
        except RuntimeError:
            # No running loop, try to get or create one
            logger.debug("No running event loop, dispatching synchronously")
            try:
                asyncio.run(coro)
            except Exception as e:
                logger.error(f"Error in sync dispatch: {e}")

    async def _safe_call(self, func, *args) -> None:
        """
        Safely call a hook method, catching any exceptions.

        Args:
            func: The hook method to call
            *args: Arguments to pass to the method
        """
        try:
            func(*args)
        except Exception as e:
            logger.error(f"Error in hook {func.__self__.__class__.__name__}: {e}")

    # --- EvolutionHook interface implementation ---

    def on_pas_change(
        self,
        old_score: float,
        new_score: float
    ) -> None:
        """Broadcast PAS score change to all registered hooks."""
        for hook in self._hooks:
            self._dispatch_async(
                self._safe_call(hook.on_pas_change, old_score, new_score)
            )

    def on_pipeline_stage(
        self,
        stage: str,
        status: str
    ) -> None:
        """Broadcast pipeline stage transition to all registered hooks."""
        for hook in self._hooks:
            self._dispatch_async(
                self._safe_call(hook.on_pipeline_stage, stage, status)
            )

    def on_self_correction(
        self,
        trigger: str,
        action: str,
        result: bool
    ) -> None:
        """Broadcast self-correction event to all registered hooks."""
        for hook in self._hooks:
            self._dispatch_async(
                self._safe_call(hook.on_self_correction, trigger, action, result)
            )


# --- Convenience implementations ---

class LoggingEvolutionHook(EvolutionHook):
    """
    Simple hook that logs all evolution events to a logger.

    Useful for debugging and monitoring the evolution pipeline.
    """

    def __init__(self, log_level: int = logging.DEBUG):
        """
        Initialize the logging hook.

        Args:
            log_level: Python logging level to use (default: DEBUG)
        """
        self._log_level = log_level

    def on_pas_change(self, old_score: float, new_score: float) -> None:
        delta = new_score - old_score
        direction = "+" if delta >= 0 else ""
        logger.log(self._log_level,
                   f"[PAS] Score changed: {old_score:.3f} -> {new_score:.3f} ({direction}{delta:.3f})")

    def on_pipeline_stage(self, stage: str, status: str) -> None:
        logger.log(self._log_level,
                   f"[Pipeline] Stage '{stage}' is {status}")

    def on_self_correction(self, trigger: str, action: str, result: bool) -> None:
        status = "SUCCESS" if result else "FAILED"
        logger.log(self._log_level,
                   f"[Correction] Trigger: {trigger}, Action: {action}, Result: {status}")


class CallbackEvolutionHook(EvolutionHook):
    """
    Hook that uses callback functions for each event type.

    Useful for quick integration without creating a full subclass.

    Example:
        >>> hook = CallbackEvolutionHook(
        ...     on_pas=lambda o, n: print(f"PAS: {o:.2f} -> {n:.2f}"),
        ...     on_stage=lambda s, st: print(f"Stage: {s} = {st}"),
        ...     on_correct=lambda t, a, r: print(f"Fix: {t}")
        ... )
    """

    def __init__(
        self,
        on_pas: Optional[callable] = None,
        on_stage: Optional[callable] = None,
        on_correct: Optional[callable] = None
    ):
        """
        Initialize with optional callbacks for each event type.

        Args:
            on_pas: Callback for PAS changes (old_score, new_score)
            on_stage: Callback for pipeline stages (stage, status)
            on_correct: Callback for self-corrections (trigger, action, result)
        """
        self._on_pas = on_pas
        self._on_stage = on_stage
        self._on_correct = on_correct

    def on_pas_change(self, old_score: float, new_score: float) -> None:
        if self._on_pas:
            self._on_pas(old_score, new_score)

    def on_pipeline_stage(self, stage: str, status: str) -> None:
        if self._on_stage:
            self._on_stage(stage, status)

    def on_self_correction(self, trigger: str, action: str, result: bool) -> None:
        if self._on_correct:
            self._on_correct(trigger, action, result)


class AsciiEmitterHook(EvolutionHook):
    """
    Hook that emits ASCII representations of evolution pipeline state.

    This is the primary hook for AI perception, generating structured
    ASCII output for the Ouroboros self-healing loop.

    Output format:
        PAS: 0.850 (+0.050)
        STAGE: Build [completed]
        CORRECTION: test_failure -> rollback = OK
    """

    def __init__(self, prefix: str = "[EVOLUTION]"):
        """
        Initialize the ASCII emitter hook.

        Args:
            prefix: Prefix string for all emitted lines
        """
        self._prefix = prefix
        self._current_stage: Optional[str] = None
        self._pas_history: List[float] = []

    def _emit(self, message: str) -> None:
        """Emit a formatted ASCII message."""
        print(f"{self._prefix} {message}")

    def on_pas_change(self, old_score: float, new_score: float) -> None:
        self._pas_history.append(new_score)
        delta = new_score - old_score
        direction = "+" if delta >= 0 else ""

        # Determine health indicator
        if new_score >= 0.9:
            health = "EXCELLENT"
        elif new_score >= 0.7:
            health = "GOOD"
        elif new_score >= 0.5:
            health = "MODERATE"
        else:
            health = "CRITICAL"

        self._emit(f"PAS: {new_score:.3f} ({direction}{delta:.3f}) [{health}]")

    def on_pipeline_stage(self, stage: str, status: str) -> None:
        self._current_stage = stage if status in ("started", "in_progress") else None

        # Status indicators
        status_map = {
            "started": "[>]",
            "in_progress": "[...]",
            "completed": "[OK]",
            "failed": "[FAIL]"
        }
        indicator = status_map.get(status, f"[{status}]")

        self._emit(f"STAGE: {stage} {indicator}")

    def on_self_correction(self, trigger: str, action: str, result: bool) -> None:
        status = "OK" if result else "FAIL"
        self._emit(f"CORRECTION: {trigger} -> {action} = {status}")


# Module-level singleton broadcaster for convenience
_default_broadcaster: Optional[EvolutionHookBroadcaster] = None


def get_evolution_broadcaster() -> EvolutionHookBroadcaster:
    """
    Get the default evolution hook broadcaster singleton.

    Returns:
        The default EvolutionHookBroadcaster instance
    """
    global _default_broadcaster
    if _default_broadcaster is None:
        _default_broadcaster = EvolutionHookBroadcaster()
        # Add ASCII emitter by default for AI perception
        _default_broadcaster.add_hook(AsciiEmitterHook())
    return _default_broadcaster
