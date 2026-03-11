"""
Evolution Daemon - Tool Callbacks

Registry for Z.ai function calling tool callbacks.

This module provides a centralized registry for tool callbacks that
the Evolution Daemon exposes to the Z.ai integration for function calling.
"""

import logging
import subprocess
from collections.abc import Callable
from typing import TYPE_CHECKING, Any, Optional

if TYPE_CHECKING:
    from .virtual_filesystem import VirtualFileSystem
    from .webmcp_client import WebMCPClient

logger = logging.getLogger("evolution_daemon.tools")


class ToolCallbackRegistry:
    """
    Registry for Z.ai function calling tool callbacks.

    Manages registration and execution of tool callbacks for:
    - File operations (read, write, execute)
    - Visual operations (inspect, place_tile, get_state, render_layout)

    Example:
        >>> registry = ToolCallbackRegistry(vfs, webmcp, visual_connected=True)
        >>> registry.register("custom_tool", my_callback)
        >>> result = await registry.call("read_file", {"path": "test.py"})
    """

    def __init__(
        self,
        vfs: Optional['VirtualFileSystem'] = None,
        webmcp: Optional['WebMCPClient'] = None,
        visual_connected: bool = False,
        visual_position: dict[str, int] | None = None
    ):
        """
        Initialize the tool callback registry.

        Args:
            vfs: VirtualFileSystem instance for file operations
            webmcp: WebMCPClient instance for visual operations
            visual_connected: Whether the visual interface is connected
            visual_position: Current visual position dict with 'x' and 'y' keys
        """
        self._vfs = vfs
        self._webmcp = webmcp
        self._visual_connected = visual_connected
        self._visual_position = visual_position or {"x": 400, "y": 300}
        self._callbacks: dict[str, Callable] = {}

        # Register default tools
        self._register_default_tools()

    def _register_default_tools(self):
        """Register the default set of tool callbacks."""
        # File tools
        self.register("read_file", self._tool_read_file)
        self.register("write_file", self._tool_write_file)
        self.register("execute_command", self._tool_execute)

        # Visual tools
        self.register("visual_inspect", self._tool_visual_inspect)
        self.register("visual_place_tile", self._tool_visual_place_tile)
        self.register("visual_get_state", self._tool_visual_get_state)
        self.register("render_visual_layout", self._tool_render_visual_layout)

    def register(self, name: str, callback: Callable) -> None:
        """
        Register a tool callback.

        Args:
            name: Tool name
            callback: Async callable that implements the tool
        """
        self._callbacks[name] = callback
        logger.debug(f"Registered tool: {name}")

    def unregister(self, name: str) -> bool:
        """
        Unregister a tool callback.

        Args:
            name: Tool name to unregister

        Returns:
            True if the tool was unregistered, False if not found
        """
        if name in self._callbacks:
            del self._callbacks[name]
            return True
        return False

    def get_registered_tools(self) -> list:
        """Get list of registered tool names."""
        return list(self._callbacks.keys())

    async def call(self, name: str, params: dict[str, Any]) -> dict[str, Any]:
        """
        Call a registered tool.

        Args:
            name: Tool name
            params: Parameters to pass to the tool

        Returns:
            Tool result dictionary
        """
        if name not in self._callbacks:
            return {"success": False, "error": f"Unknown tool: {name}"}

        try:
            return await self._callbacks[name](**params)
        except Exception as e:
            logger.error(f"Tool {name} failed: {e}")
            return {"success": False, "error": str(e)}

    def set_visual_connected(self, connected: bool) -> None:
        """Update visual connection status."""
        self._visual_connected = connected

    def set_visual_position(self, x: int, y: int) -> None:
        """Update visual position."""
        self._visual_position = {"x": x, "y": y}

    # === File Tools ===

    async def _tool_read_file(self, path: str) -> dict:
        """Tool: Read file from codebase"""
        if not self._vfs:
            return {"success": False, "error": "VFS not initialized"}

        try:
            content = await self._vfs.read_file(path)
            return {"success": True, "content": content}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_write_file(self, path: str, content: str) -> dict:
        """Tool: Write file to codebase (SELF-MODIFICATION)"""
        if not self._vfs:
            return {"success": False, "error": "VFS not initialized"}

        try:
            await self._vfs.write_file(path, content)
            return {"success": True, "path": path}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_execute(self, command: str) -> dict:
        """Tool: Execute shell command (sandboxed)"""
        # Safety: Only allow certain commands
        allowed_prefixes = ["pytest", "python -m", "ls", "cat", "grep"]
        if not any(command.startswith(prefix) for prefix in allowed_prefixes):
            return {"success": False, "error": "Command not allowed"}

        try:
            result = subprocess.run(
                command,
                shell=True,
                capture_output=True,
                text=True,
                timeout=30,
                cwd=str(self._vfs.root) if self._vfs else "."
            )
            return {
                "success": result.returncode == 0,
                "output": result.stdout + result.stderr
            }
        except Exception as e:
            return {"success": False, "error": str(e)}

    # === Visual Tools ===

    async def _tool_visual_inspect(
        self,
        x: int = None,
        y: int = None,
        width: int = 100,
        height: int = 100
    ) -> dict:
        """Tool: Inspect a region of the visual map"""
        if not self._visual_connected or not self._webmcp:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            x = x or self._visual_position["x"]
            y = y or self._visual_position["y"]

            result = await self._webmcp.inspect_region(x, y, width, height)
            return {"success": True, "region": result}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_visual_place_tile(
        self,
        x: int,
        y: int,
        tile_type: str,
        data: dict = None
    ) -> dict:
        """Tool: Place a tile on the visual map"""
        if not self._visual_connected or not self._webmcp:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            result = await self._webmcp.place_tile(x, y, tile_type, data)
            return {"success": True, "result": result}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_visual_get_state(self) -> dict:
        """Tool: Get current OS state from the visual map"""
        if not self._visual_connected or not self._webmcp:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            state = await self._webmcp.get_os_state()
            return {"success": True, "state": state}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_render_visual_layout(
        self,
        detail_level: str = "standard",
        region: dict = None
    ) -> dict:
        """Tool: Render the current visual state as an ASCII layout (Mirror Neuron)"""
        if not self._visual_connected or not self._webmcp:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            result = await self._webmcp.render_visual_layout(detail_level, region)
            return {"success": True, "layout": result.get("layout", "")}
        except Exception as e:
            return {"success": False, "error": str(e)}
