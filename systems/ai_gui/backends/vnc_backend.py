"""
VNC Backend for AI-GUI Control Surface.

Implements app tiles via VNC streaming from QEMU containers.
Phase 1: Stub implementation - logs commands instead of executing.
Phase 2: Full QEMU + websockify integration.
"""

import io
import uuid
from dataclasses import dataclass, field
from typing import Optional
import logging

from systems.ai_gui.backends.base import BaseBackend, InputEvent, InputEventType, AppConfig
from systems.ai_gui.tile_app_manager import Tile, TileState

logger = logging.getLogger(__name__)

# Placeholder PNG - 1x1 gray pixel
PLACEHOLDER_PNG = bytes([
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,  # PNG signature
    0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,  # IHDR chunk
    0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,  # 1x1
    0x08, 0x02, 0x00, 0x00, 0x00, 0x90, 0x77, 0x53,
    0xDE, 0x00, 0x00, 0x00, 0x0C, 0x49, 0x44, 0x41,  # IDAT chunk
    0x54, 0x08, 0xD7, 0x63, 0xB8, 0xB8, 0xB8, 0x00,
    0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x18, 0xDD,
    0x8D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45,  # IEND chunk
    0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82
])


class VNCBackend(BaseBackend):
    """
    VNC-based tile backend.

    Spawns apps in QEMU VMs with VNC display, bridges to WebSocket
    for browser/PixiJS access.

    Phase 1 (Current): Stub implementation that logs commands.
    Phase 2: Full QEMU + websockify integration.
    """

    def __init__(self, start_display: int = 10, start_websockify_port: int = 5900):
        """
        Initialize VNC backend.

        Args:
            start_display: Starting VNC display number (:10 = port 5910)
            start_websockify_port: Starting WebSocket port for websockify
        """
        self._next_display = start_display
        self._next_ws_port = start_websockify_port
        self._tiles: dict[str, Tile] = {}
        self._tile_processes: dict[str, any] = {}  # Stub: no real processes

    def _get_next_vnc_display(self) -> int:
        """Get next available VNC display number."""
        display = self._next_display
        self._next_display += 1
        return display

    def _get_next_websockify_port(self) -> int:
        """Get next available websockify port."""
        port = self._next_ws_port
        self._next_ws_port += 1
        return port

    def _generate_tile_id(self) -> str:
        """Generate unique tile ID."""
        return f"vnc_tile_{uuid.uuid4().hex[:8]}"

    def _build_qemu_command(self, config: AppConfig, display: int) -> list[str]:
        """
        Build QEMU command for spawning an app.

        Phase 1: Returns command but doesn't execute.
        Phase 2: Will actually execute the command.
        """
        vnc_port = 5900 + display

        # Base QEMU command
        cmd = [
            "qemu-system-x86_64",
            "-m", "512M",  # Memory
            "-vnc", f":{display}",  # VNC display
            "-display", "none",  # No local display
            "-cdrom", f"{config.app}.iso",  # App ISO (placeholder)
        ]

        logger.debug(f"[STUB] QEMU command: {' '.join(cmd)}")
        return cmd

    async def spawn(self, config: AppConfig) -> Tile:
        """
        Spawn an app as a VNC tile.

        Phase 1: Creates tile, logs command, doesn't actually start QEMU.
        Phase 2: Will start QEMU and websockify.

        Args:
            config: App configuration

        Returns:
            Tile representing the spawned app
        """
        # Get resources
        display = self._get_next_vnc_display()
        ws_port = self._get_next_websockify_port()
        tile_id = self._generate_tile_id()

        # Build QEMU command (Phase 1: just log it)
        qemu_cmd = self._build_qemu_command(config, display)
        logger.info(f"[STUB] Would spawn QEMU for {config.app}: {' '.join(qemu_cmd)}")

        # Create tile
        tile = Tile(
            id=tile_id,
            app=config.app,
            backend="vnc",
            location=config.location or (0, 0),
            state=TileState.SPAWNING,
            width=config.width,
            height=config.height,
            metadata={
                "vnc_display": display,
                "vnc_port": 5900 + display,
                "websockify_port": ws_port,
                "qemu_cmd": ' '.join(qemu_cmd),
            }
        )

        # Register tile
        self._tiles[tile_id] = tile
        self._tile_processes[tile_id] = None  # Stub: no real process

        # Phase 1: Simulate immediate spawn completion
        # Phase 2: Wait for QEMU to be ready
        tile.state = TileState.RUNNING
        logger.info(f"[STUB] Spawned VNC tile {tile_id} for {config.app} on display :{display}")

        return tile

    async def send_input(self, tile_id: str, event: InputEvent) -> bool:
        """
        Send input to a VNC tile.

        Phase 1: Logs input, returns True.
        Phase 2: Will send via VNC protocol.

        Args:
            tile_id: Tile identifier
            event: Input event to send

        Returns:
            True if input was sent successfully
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"[STUB] Cannot send input to unknown tile {tile_id}")
            return False

        if event.type == InputEventType.KEY:
            logger.debug(f"[STUB] Would send key '{event.keys}' to tile {tile_id}")
        elif event.type == InputEventType.MOUSE:
            logger.debug(f"[STUB] Would send mouse ({event.x}, {event.y}) btn={event.button} to tile {tile_id}")
        elif event.type == InputEventType.TEXT:
            logger.debug(f"[STUB] Would type '{event.text}' to tile {tile_id}")

        return True

    async def capture_frame(self, tile_id: str) -> Optional[bytes]:
        """
        Capture current frame from VNC tile.

        Phase 1: Returns placeholder PNG.
        Phase 2: Will capture actual VNC framebuffer.

        Args:
            tile_id: Tile identifier

        Returns:
            PNG bytes of current frame, or None if tile not found
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"[STUB] Cannot capture frame from unknown tile {tile_id}")
            return None

        logger.debug(f"[STUB] Would capture frame from tile {tile_id}")

        # Phase 1: Return placeholder PNG
        # Phase 2: Capture actual framebuffer via VNC
        return PLACEHOLDER_PNG

    async def terminate(self, tile_id: str) -> bool:
        """
        Terminate a VNC tile.

        Phase 1: Removes from registry, returns True.
        Phase 2: Will actually kill QEMU process.

        Args:
            tile_id: Tile identifier

        Returns:
            True if termination was successful
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"[STUB] Cannot terminate unknown tile {tile_id}")
            return False

        logger.info(f"[STUB] Would terminate QEMU for tile {tile_id}")

        # Remove from registries
        del self._tiles[tile_id]
        if tile_id in self._tile_processes:
            del self._tile_processes[tile_id]

        return True

    async def health_check(self, tile_id: str) -> bool:
        """
        Check if VNC tile is healthy.

        Phase 1: Returns True if tile exists in registry.
        Phase 2: Will check if QEMU process is running and VNC is responsive.

        Args:
            tile_id: Tile identifier

        Returns:
            True if tile is healthy
        """
        exists = tile_id in self._tiles
        logger.debug(f"[STUB] Health check for tile {tile_id}: {exists}")
        return exists
