"""
Install Package for PixelRTS

Provides components for visual installer engine:
- InstallProgress: Visual progress display for install operations
- InstallStage: Enum for install phases
- DiskWriter: Chunked disk writer with cancellation support
- WriteResult: Result of a disk write operation
- InstallEngine: Orchestrates full installation flow
- InstallResult: Result of an install operation
- InstallError: Exception for install errors
"""

from .install_progress import InstallProgress, InstallStage, create_install_progress
from .disk_writer import DiskWriter, WriteResult
from .install_engine import InstallEngine, InstallResult, InstallError

__all__ = [
    "InstallProgress",
    "InstallStage",
    "create_install_progress",
    "DiskWriter",
    "WriteResult",
    "InstallEngine",
    "InstallResult",
    "InstallError",
]
