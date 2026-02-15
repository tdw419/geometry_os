"""
Install Package for PixelRTS

Provides components for visual installer engine:
- InstallProgress: Visual progress display for install operations
- InstallStage: Enum for install phases
- DiskWriter: Chunked disk writer with cancellation support
- WriteResult: Result of a disk write operation
"""

from .install_progress import InstallProgress, InstallStage, create_install_progress

__all__ = [
    "InstallProgress",
    "InstallStage",
    "create_install_progress",
]
