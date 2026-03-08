"""
PixelRTS Serve Module

Provides network serving capabilities for PixelRTS containers:
- NBD server plugin for nbdkit
"""

from .nbd_plugin import PixelRTSPlugin

__all__ = ['PixelRTSPlugin']
