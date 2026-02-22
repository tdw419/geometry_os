"""
Boot Package for PixelRTS

Provides FUSE mount lifecycle management and boot bridge functionality
for booting operating systems from PixelRTS containers.

Key Classes:
    - MountHelper: Safe FUSE mount/unmount with automatic cleanup
    - BootBridge: Unified FUSE mount + QEMU boot orchestration
    - BootResult: Data class for boot operation results
    - BootProgress: Visual progress display for boot operations
    - ProgressStage: Enum for boot progress stages
"""

from .mount_helper import MountHelper, MountError
from .boot_bridge import BootBridge, BootResult
from .boot_progress import BootProgress, ProgressStage

__all__ = [
    "MountHelper",
    "MountError",
    "BootBridge",
    "BootResult",
    "BootProgress",
    "ProgressStage",
]
