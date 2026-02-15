"""Autofix Metrics - Track daemon performance and activity."""

import time
from dataclasses import dataclass, field
from typing import Dict, Any, List


@dataclass
class AutofixMetrics:
    """
    Track metrics for the autonomous improvement daemon.

    Records:
        - Tests fixed vs attempted
        - Rejection reasons
        - Uptime
    """

    start_time: float = field(default_factory=time.time)
    tests_fixed: int = 0
    fixes_attempted: int = 0
    fixes_rejected: int = 0
    rejection_reasons: List[str] = field(default_factory=list)

    def record_fix_attempt(self) -> None:
        """Record that a fix was attempted."""
        self.fixes_attempted += 1

    def record_fix_success(self) -> None:
        """Record that a fix was successfully applied."""
        self.tests_fixed += 1

    def record_fix_rejected(self, reason: str) -> None:
        """Record that a fix was rejected and why."""
        self.fixes_rejected += 1
        self.rejection_reasons.append(reason)

    @property
    def uptime_seconds(self) -> float:
        """Return uptime in seconds."""
        return time.time() - self.start_time

    @property
    def success_rate(self) -> float:
        """Return fix success rate (0.0 to 1.0)."""
        if self.fixes_attempted == 0:
            return 0.0
        return self.tests_fixed / self.fixes_attempted

    def get_summary(self) -> Dict[str, Any]:
        """
        Get a summary of all metrics.

        Returns:
            Dict with all metric values
        """
        return {
            "uptime_seconds": round(self.uptime_seconds, 1),
            "fixes_attempted": self.fixes_attempted,
            "tests_fixed": self.tests_fixed,
            "fixes_rejected": self.fixes_rejected,
            "success_rate": round(self.success_rate, 3),
            "recent_rejections": self.rejection_reasons[-5:],
        }
