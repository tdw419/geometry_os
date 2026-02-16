"""
AI-GUI Control Surface for Geometry OS

Enables AI agents to operate GUI applications as first-class tiles
on the Infinite Map. Apps become tiles, AI uses WebMCP.

Architecture:
- AI-GUI Orchestrator: Goal parser, workflow engine, tile app manager
- Toolkit Specialists: GTK/Qt/Electron semantic access
- Hybrid Tile Backends: VNC (universal), WASM (fast), Native (specialized)
"""

__version__ = "0.1.0"
__author__ = "Geometry OS Team"

# Public API
from systems.ai_gui.tile_app_manager import TileAppManager, Tile
from systems.ai_gui.backends.base import BaseBackend, InputEvent, AppConfig

__all__ = [
    "__version__",
    "TileAppManager",
    "Tile",
    "BaseBackend",
    "InputEvent",
    "AppConfig",
]
