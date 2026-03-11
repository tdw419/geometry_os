"""Autonomous Improvement Daemon for Geometry OS.

The autofix daemon provides autonomous code improvement capabilities:
- Issue detection through static analysis
- Safe fix application with rollback
- Continuous monitoring and improvement
- Pattern-based fix generation for common errors
"""

from .daemon import AutofixDaemon
from .fixer import AutofixGenerator
from .metrics import AutofixMetrics

__all__ = ["AutofixDaemon", "AutofixGenerator", "AutofixMetrics"]
