#!/usr/bin/env python3
"""
Evolution Budget Manager
========================

Rate limiting for recursive prompt evolution to prevent:
- Runaway evolution loops
- Excessive API calls to Gemini/LLM
- Rapid-fire prompt changes without testing
- Resource exhaustion

This is part of the RPE stability enhancement suite, providing the
third safeguard alongside PromptVersionManager and PromptValidator.

Usage:
    from systems.intelligence.evolution_budget import EvolutionBudget

    budget = EvolutionBudget(max_per_hour=3, max_per_day=20)

    if budget.can_evolve():
        new_prompt = evolve_prompt()
        budget.record_evolution()
    else:
        print(f"Budget exhausted: {budget.get_status()}")
"""

import time
import logging
from typing import Dict, List, Any, Optional, Tuple
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from pathlib import Path
from collections import deque
import json
import threading

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [BUDGET] %(message)s')
logger = logging.getLogger(__name__)


@dataclass
class EvolutionRecord:
    """Record of a single evolution event."""
    timestamp: float
    version_id: str = ""
    prompt_hash: str = ""
    metrics: Dict[str, Any] = field(default_factory=dict)
    success: bool = True
    reason: str = ""

    def to_dict(self) -> Dict[str, Any]:
        return {
            "timestamp": self.timestamp,
            "version_id": self.version_id,
            "prompt_hash": self.prompt_hash,
            "metrics": self.metrics,
            "success": self.success,
            "reason": self.reason
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'EvolutionRecord':
        return cls(
            timestamp=data.get("timestamp", 0),
            version_id=data.get("version_id", ""),
            prompt_hash=data.get("prompt_hash", ""),
            metrics=data.get("metrics", {}),
            success=data.get("success", True),
            reason=data.get("reason", "")
        )


@dataclass
class BudgetStatus:
    """Current status of the evolution budget."""
    can_evolve: bool
    hourly_used: int
    hourly_limit: int
    daily_used: int
    daily_limit: int
    cooldown_remaining: float
    next_evolution_at: Optional[float]
    reason: str

    def to_dict(self) -> Dict[str, Any]:
        return {
            "can_evolve": self.can_evolve,
            "hourly_used": self.hourly_used,
            "hourly_limit": self.hourly_limit,
            "daily_used": self.daily_used,
            "daily_limit": self.daily_limit,
            "cooldown_remaining": self.cooldown_remaining,
            "next_evolution_at": self.next_evolution_at,
            "reason": self.reason
        }


class EvolutionBudget:
    """
    Manages evolution rate limiting with multiple constraints.

    Features:
    - Hourly rate limit (e.g., max 3 evolutions per hour)
    - Daily rate limit (e.g., max 20 evolutions per day)
    - Cooldown period between evolutions (e.g., 5 minutes)
    - Burst protection (e.g., max 2 rapid evolutions)
    - Persistence to track across restarts
    - Thread-safe operation

    Example:
        >>> budget = EvolutionBudget(max_per_hour=3, max_per_day=20)
        >>> can_evolve, reason = budget.can_evolve()
        >>> if can_evolve:
        ...     # Perform evolution
        ...     budget.record_evolution(version_id="v2", metrics={"latency": 3000})
    """

    DEFAULT_MAX_PER_HOUR = 3
    DEFAULT_MAX_PER_DAY = 20
    DEFAULT_COOLDOWN_SECONDS = 300  # 5 minutes
    DEFAULT_BURST_LIMIT = 2
    DEFAULT_BURST_WINDOW = 60  # 1 minute

    def __init__(
        self,
        max_per_hour: int = None,
        max_per_day: int = None,
        cooldown_seconds: float = None,
        burst_limit: int = None,
        burst_window_seconds: float = None,
        storage_path: str = None,
        auto_save: bool = True
    ):
        """
        Initialize the EvolutionBudget.

        Args:
            max_per_hour: Maximum evolutions per hour (default: 3)
            max_per_day: Maximum evolutions per day (default: 20)
            cooldown_seconds: Minimum time between evolutions (default: 300)
            burst_limit: Maximum rapid evolutions (default: 2)
            burst_window_seconds: Time window for burst detection (default: 60)
            storage_path: Path to persist budget state (None = no persistence)
            auto_save: Automatically save after each evolution
        """
        self.max_per_hour = max_per_hour if max_per_hour is not None else self.DEFAULT_MAX_PER_HOUR
        self.max_per_day = max_per_day if max_per_day is not None else self.DEFAULT_MAX_PER_DAY
        self.cooldown_seconds = cooldown_seconds if cooldown_seconds is not None else self.DEFAULT_COOLDOWN_SECONDS
        self.burst_limit = burst_limit if burst_limit is not None else self.DEFAULT_BURST_LIMIT
        self.burst_window = burst_window_seconds if burst_window_seconds is not None else self.DEFAULT_BURST_WINDOW
        self.storage_path = Path(storage_path) if storage_path else None
        self.auto_save = auto_save

        # Evolution history (timestamp-based)
        self._history: List[EvolutionRecord] = []
        self._last_evolution_time: float = 0

        # Thread safety
        self._lock = threading.Lock()

        # Load existing state
        if self.storage_path and self.storage_path.exists():
            self._load()

        logger.info(
            f"EvolutionBudget initialized: "
            f"{self.max_per_hour}/hour, {self.max_per_day}/day, "
            f"cooldown={self.cooldown_seconds}s"
        )

    # =========================================================================
    # CORE OPERATIONS
    # =========================================================================

    def can_evolve(self) -> Tuple[bool, str]:
        """
        Check if evolution is allowed under current budget constraints.

        Returns:
            Tuple of (can_evolve: bool, reason: str)
        """
        with self._lock:
            now = time.time()

            # Check cooldown
            cooldown_remaining = self.cooldown_seconds - (now - self._last_evolution_time)
            if cooldown_remaining > 0:
                return False, f"Cooldown active ({cooldown_remaining:.0f}s remaining)"

            # Check hourly limit
            hour_ago = now - 3600
            hourly_count = sum(1 for r in self._history if r.timestamp > hour_ago)
            if hourly_count >= self.max_per_hour:
                return False, f"Hourly budget exhausted ({hourly_count}/{self.max_per_hour})"

            # Check daily limit
            day_ago = now - 86400
            daily_count = sum(1 for r in self._history if r.timestamp > day_ago)
            if daily_count >= self.max_per_day:
                return False, f"Daily budget exhausted ({daily_count}/{self.max_per_day})"

            # Check burst protection
            burst_window_start = now - self.burst_window
            burst_count = sum(1 for r in self._history if r.timestamp > burst_window_start)
            if burst_count >= self.burst_limit:
                next_allowed = burst_window_start + self.burst_window
                wait_time = next_allowed - now
                return False, f"Burst protection active (wait {wait_time:.0f}s)"

            return True, "Evolution allowed"

    def record_evolution(
        self,
        version_id: str = "",
        prompt_hash: str = "",
        metrics: Dict[str, Any] = None,
        success: bool = True,
        reason: str = ""
    ) -> str:
        """
        Record an evolution event.

        Args:
            version_id: The version ID of the new prompt
            prompt_hash: Hash of the new prompt
            metrics: Metrics from the evolution
            success: Whether the evolution succeeded
            reason: Reason for the evolution

        Returns:
            str: Record ID (timestamp-based)
        """
        with self._lock:
            now = time.time()

            record = EvolutionRecord(
                timestamp=now,
                version_id=version_id,
                prompt_hash=prompt_hash,
                metrics=metrics or {},
                success=success,
                reason=reason
            )

            self._history.append(record)
            self._last_evolution_time = now

            # Clean old records (keep last 7 days)
            week_ago = now - (7 * 86400)
            self._history = [r for r in self._history if r.timestamp > week_ago]

            logger.info(
                f"Evolution recorded: version={version_id}, "
                f"hourly={self._count_hourly()}/{self.max_per_hour}, "
                f"daily={self._count_daily()}/{self.max_per_day}"
            )

            # Auto-save
            if self.auto_save:
                self._save()

            return str(now)

    def force_evolution(self, reason: str = "forced") -> bool:
        """
        Force an evolution regardless of budget (admin override).

        This should be used sparingly and will log a warning.

        Args:
            reason: Why the evolution is being forced

        Returns:
            bool: Always True
        """
        logger.warning(f"FORCED EVOLUTION: {reason}")

        return True

    # =========================================================================
    # STATUS & QUERIES
    # =========================================================================

    def get_status(self) -> BudgetStatus:
        """
        Get current budget status.

        Returns:
            BudgetStatus with all current constraints
        """
        with self._lock:
            now = time.time()
            can_evolve, reason = self.can_evolve()

            # Calculate cooldown
            cooldown_remaining = max(0, self.cooldown_seconds - (now - self._last_evolution_time))

            # Calculate next evolution time
            next_evolution_at = None
            if not can_evolve:
                if "Cooldown" in reason:
                    next_evolution_at = self._last_evolution_time + self.cooldown_seconds
                elif "Hourly" in reason:
                    # Find oldest record in current hour
                    hour_ago = now - 3600
                    hourly_records = [r for r in self._history if r.timestamp > hour_ago]
                    if hourly_records:
                        oldest = min(r.timestamp for r in hourly_records)
                        next_evolution_at = oldest + 3600
                elif "Daily" in reason:
                    day_ago = now - 86400
                    daily_records = [r for r in self._history if r.timestamp > day_ago]
                    if daily_records:
                        oldest = min(r.timestamp for r in daily_records)
                        next_evolution_at = oldest + 86400

            return BudgetStatus(
                can_evolve=can_evolve,
                hourly_used=self._count_hourly(),
                hourly_limit=self.max_per_hour,
                daily_used=self._count_daily(),
                daily_limit=self.max_per_day,
                cooldown_remaining=cooldown_remaining,
                next_evolution_at=next_evolution_at,
                reason=reason
            )

    def get_history(self, hours: int = 24) -> List[EvolutionRecord]:
        """
        Get evolution history for the specified time period.

        Args:
            hours: Number of hours of history to return

        Returns:
            List of EvolutionRecord objects
        """
        with self._lock:
            cutoff = time.time() - (hours * 3600)
            return [r for r in self._history if r.timestamp > cutoff]

    def get_stats(self) -> Dict[str, Any]:
        """
        Get evolution statistics.

        Returns:
            Dict with success rate, average metrics, etc.
        """
        with self._lock:
            if not self._history:
                return {
                    "total_evolutions": 0,
                    "success_rate": 0,
                    "last_evolution": None
                }

            total = len(self._history)
            successful = sum(1 for r in self._history if r.success)
            last = self._history[-1] if self._history else None

            return {
                "total_evolutions": total,
                "successful_evolutions": successful,
                "failed_evolutions": total - successful,
                "success_rate": successful / total if total > 0 else 0,
                "last_evolution": last.to_dict() if last else None,
                "hourly_usage": f"{self._count_hourly()}/{self.max_per_hour}",
                "daily_usage": f"{self._count_daily()}/{self.max_per_day}"
            }

    def reset_hourly(self) -> int:
        """
        Reset hourly budget (admin action).

        Returns:
            int: Number of records removed
        """
        with self._lock:
            hour_ago = time.time() - 3600
            before = len(self._history)
            self._history = [r for r in self._history if r.timestamp <= hour_ago]
            removed = before - len(self._history)

            logger.warning(f"Hourly budget reset: removed {removed} records")

            if self.auto_save:
                self._save()

            return removed

    def reset_daily(self) -> int:
        """
        Reset daily budget (admin action).

        Returns:
            int: Number of records removed
        """
        with self._lock:
            day_ago = time.time() - 86400
            before = len(self._history)
            self._history = [r for r in self._history if r.timestamp <= day_ago]
            removed = before - len(self._history)

            logger.warning(f"Daily budget reset: removed {removed} records")

            if self.auto_save:
                self._save()

            return removed

    def clear_all(self) -> int:
        """
        Clear all budget history (admin action).

        Returns:
            int: Number of records removed
        """
        with self._lock:
            removed = len(self._history)
            self._history.clear()
            self._last_evolution_time = 0

            logger.warning(f"All budget history cleared: {removed} records")

            if self.auto_save:
                self._save()

            return removed

    # =========================================================================
    # INTERNAL HELPERS
    # =========================================================================

    def _count_hourly(self) -> int:
        """Count evolutions in the last hour."""
        hour_ago = time.time() - 3600
        return sum(1 for r in self._history if r.timestamp > hour_ago)

    def _count_daily(self) -> int:
        """Count evolutions in the last 24 hours."""
        day_ago = time.time() - 86400
        return sum(1 for r in self._history if r.timestamp > day_ago)

    # =========================================================================
    # PERSISTENCE
    # =========================================================================

    def _save(self) -> bool:
        """Save budget state to file."""
        if not self.storage_path:
            return False

        try:
            data = {
                "history": [r.to_dict() for r in self._history],
                "last_evolution_time": self._last_evolution_time,
                "config": {
                    "max_per_hour": self.max_per_hour,
                    "max_per_day": self.max_per_day,
                    "cooldown_seconds": self.cooldown_seconds,
                    "burst_limit": self.burst_limit,
                    "burst_window": self.burst_window
                },
                "saved_at": time.time()
            }

            # Atomic write
            temp_path = self.storage_path.with_suffix('.tmp')
            with open(temp_path, 'w') as f:
                json.dump(data, f, indent=2)
            temp_path.replace(self.storage_path)

            return True

        except Exception as e:
            logger.error(f"Failed to save budget: {e}")
            return False

    def _load(self) -> bool:
        """Load budget state from file."""
        if not self.storage_path or not self.storage_path.exists():
            return False

        try:
            with open(self.storage_path, 'r') as f:
                data = json.load(f)

            self._history = [EvolutionRecord.from_dict(r) for r in data.get("history", [])]
            self._last_evolution_time = data.get("last_evolution_time", 0)

            # Clean old records on load
            week_ago = time.time() - (7 * 86400)
            self._history = [r for r in self._history if r.timestamp > week_ago]

            logger.info(f"Loaded budget state: {len(self._history)} records")
            return True

        except Exception as e:
            logger.error(f"Failed to load budget: {e}")
            return False

    def __repr__(self) -> str:
        return (
            f"EvolutionBudget("
            f"hourly={self._count_hourly()}/{self.max_per_hour}, "
            f"daily={self._count_daily()}/{self.max_per_day})"
        )


# =============================================================================
# CONTEXT MANAGER
# =============================================================================

class EvolutionGuard:
    """
    Context manager for safe evolution with automatic budget checking.

    Example:
        >>> budget = EvolutionBudget()
        >>> with EvolutionGuard(budget) as guard:
        ...     if guard.allowed:
        ...         # Perform evolution
        ...         guard.record_success(version_id="v2")
        ...     else:
        ...         print(f"Evolution blocked: {guard.reason}")
    """

    def __init__(self, budget: EvolutionBudget):
        self.budget = budget
        self.allowed = False
        self.reason = ""
        self._recorded = False

    def __enter__(self) -> 'EvolutionGuard':
        self.allowed, self.reason = self.budget.can_evolve()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        if not self._recorded and self.allowed:
            # Auto-record if not manually recorded
            self.budget.record_evolution(
                success=exc_type is None,
                reason="auto-recorded"
            )
        return False  # Don't suppress exceptions

    def record_success(self, version_id: str = "", metrics: Dict[str, Any] = None):
        """Record successful evolution."""
        if self.allowed:
            self.budget.record_evolution(
                version_id=version_id,
                metrics=metrics,
                success=True,
                reason="manual"
            )
            self._recorded = True

    def record_failure(self, reason: str = ""):
        """Record failed evolution."""
        if self.allowed:
            self.budget.record_evolution(
                success=False,
                reason=reason or "failed"
            )
            self._recorded = True


# =============================================================================
# DECORATOR
# =============================================================================

def with_evolution_budget(budget: EvolutionBudget, on_blocked: str = "raise"):
    """
    Decorator to wrap evolution functions with budget checking.

    Args:
        budget: The EvolutionBudget instance
        on_blocked: What to do when blocked - "raise", "skip", or "log"

    Example:
        >>> budget = EvolutionBudget(max_per_hour=2)
        >>>
        >>> @with_evolution_budget(budget, on_blocked="skip")
        ... def evolve_prompt(current: str) -> str:
        ...     return current + " optimized"
    """
    def decorator(func):
        def wrapper(*args, **kwargs):
            can_evolve, reason = budget.can_evolve()

            if not can_evolve:
                if on_blocked == "raise":
                    raise RuntimeError(f"Evolution blocked: {reason}")
                elif on_blocked == "skip":
                    logger.info(f"Skipping evolution: {reason}")
                    return None
                else:  # log
                    logger.warning(f"Evolution blocked: {reason}")
                    return None

            try:
                result = func(*args, **kwargs)
                budget.record_evolution(success=True)
                return result
            except Exception as e:
                budget.record_evolution(success=False, reason=str(e))
                raise

        return wrapper
    return decorator


# =============================================================================
# MAIN (Demo/Testing)
# =============================================================================

if __name__ == "__main__":
    print("=" * 60)
    print("Evolution Budget Manager - Demo")
    print("=" * 60)

    # Create budget with aggressive limits for demo
    budget = EvolutionBudget(
        max_per_hour=3,
        max_per_day=10,
        cooldown_seconds=2,  # Short for demo
        burst_limit=2,
        burst_window_seconds=1
    )

    print(f"\n📊 Initial status: {budget.get_status().to_dict()}")

    # Test 1: Should succeed
    print("\n🔄 Test 1: First evolution")
    can_evolve, reason = budget.can_evolve()
    print(f"   Can evolve: {can_evolve} - {reason}")
    if can_evolve:
        budget.record_evolution(version_id="v1", metrics={"latency": 5000})

    # Test 2: Cooldown should block
    print("\n🔄 Test 2: Immediate second evolution (cooldown)")
    can_evolve, reason = budget.can_evolve()
    print(f"   Can evolve: {can_evolve} - {reason}")

    # Test 3: Wait for cooldown
    print("\n⏳ Waiting for cooldown...")
    time.sleep(2.5)

    print("\n🔄 Test 3: After cooldown")
    can_evolve, reason = budget.can_evolve()
    print(f"   Can evolve: {can_evolve} - {reason}")
    if can_evolve:
        budget.record_evolution(version_id="v2")

    # Test 4: Burst protection
    print("\n🔄 Test 4: Burst protection")
    time.sleep(0.5)
    budget.record_evolution(version_id="v3")

    can_evolve, reason = budget.can_evolve()
    print(f"   Can evolve: {can_evolve} - {reason}")

    # Show final stats
    print("\n📈 Final statistics:")
    stats = budget.get_stats()
    for key, value in stats.items():
        print(f"   {key}: {value}")

    # Test context manager
    print("\n🔓 Testing EvolutionGuard context manager:")
    with EvolutionGuard(budget) as guard:
        if guard.allowed:
            print(f"   Allowed to evolve: {guard.reason}")
            guard.record_success(version_id="v4")
        else:
            print(f"   Blocked: {guard.reason}")

    print("\n📊 Final status:")
    status = budget.get_status()
    print(f"   Hourly: {status.hourly_used}/{status.hourly_limit}")
    print(f"   Daily: {status.daily_used}/{status.daily_limit}")

    print("\n" + "=" * 60)
    print("Demo complete!")
    print("=" * 60)
