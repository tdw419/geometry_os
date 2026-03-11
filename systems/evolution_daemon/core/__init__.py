"""
Evolution Daemon Core - Extracted components for better maintainability.

This package contains the refactored components extracted from the monolithic
evolution_daemon.py for improved readability and separation of concerns.

Components:
- WebMCPClient: WebSocket client for PixiJS visual shell
- VirtualFileSystem: File system operations for self-modification
- EvolutionTask: Task dataclass for evolution proposals
- CodebaseAnalysis: Analysis results dataclass
- ToolCallbackRegistry: Z.ai function calling tool registry
- AmbientModeController: WordPress WebMCP narrative mode
- RadioController: GOSR radio broadcasting
"""

from .ambient_mode import AmbientModeController
from .radio_controller import RadioController
from .task_dataclasses import CodebaseAnalysis, EvolutionTask
from .tool_callbacks import ToolCallbackRegistry
from .virtual_filesystem import VirtualFileSystem
from .webmcp_client import WebMCPClient

__all__ = [
    "WebMCPClient",
    "VirtualFileSystem",
    "EvolutionTask",
    "CodebaseAnalysis",
    "ToolCallbackRegistry",
    "AmbientModeController",
    "RadioController",
]
