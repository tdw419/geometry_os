"""Autonomous Improvement Daemon for Geometry OS.

The autofix daemon provides autonomous code improvement capabilities:
- Issue detection through static analysis
- Safe fix application with rollback
- Continuous monitoring and improvement
"""

from .daemon import AutofixDaemon

__all__ = ["AutofixDaemon"]
