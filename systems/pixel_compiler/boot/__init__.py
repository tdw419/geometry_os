"""
Boot Package for PixelRTS

Provides FUSE mount lifecycle management and boot bridge functionality
for booting operating systems from PixelRTS containers.

Key Classes:
    - MountHelper: Safe FUSE mount/unmount with automatic cleanup
    - BootBridge: QEMU boot integration (Phase 2, Plan 02)
"""

from .mount_helper import MountHelper, MountError

# BootBridge will be added in plan 02
try:
    from .boot_bridge import BootBridge
except ImportError:
    BootBridge = None  # Not yet implemented

__all__ = ["MountHelper", "MountError", "BootBridge"]
