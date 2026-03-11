#!/usr/bin/env python3
"""
UI Transmuter Wrapper for Evolution Daemon.

This module provides a clean import path for UITransmuter by reusing
the existing implementation from the conductor track.

Usage:
    from systems.evolution_daemon.ui_transmuter import UITransmuter, transmute_extraction

The underlying implementation is at:
    conductor/tracks/shotcut-on-the-map/ui_transmuter.py
"""

import sys
from pathlib import Path

# Add conductor track to path for import
_conductor_track = Path(__file__).parent.parent.parent / "conductor" / "tracks" / "shotcut-on-the-map"
if str(_conductor_track) not in sys.path:
    sys.path.insert(0, str(_conductor_track))

# Import and re-export
from ui_transmuter import UITransmuter, transmute_extraction

__all__ = ["UITransmuter", "transmute_extraction"]
