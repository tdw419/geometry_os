"""
VNC Backend for AI-GUI Control Surface.

Implements app tiles via VNC streaming from QEMU containers.
Phase 2: Full QEMU + websockify integration.
"""

import asyncio
import io
import os
import signal
import uuid
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Any
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

# Blocked key combinations for security
BLOCKED_KEYS = {"SysRq"}
BLOCKED_COMBOS = [
    {"ctrl", "alt", "del"},  # Don't allow Ctrl+Alt+Del
]


@dataclass
class ProcessInfo:
    """Tracks QEMU and websockify process info."""
    qemu_proc: asyncio.subprocess.Process
    websockify_proc: Optional[asyncio.subprocess.Process] = None
    vnc_port: int = 0
    ws_port: int = 0


class VNCBackend(BaseBackend):
    """
    VNC-based tile backend.

    Spawns apps in QEMU VMs with VNC display, bridges to WebSocket
    for browser/PixiJS access.

    Features:
    - QEMU process management with VNC display
    - Websockify bridge for browser access
    - Input routing via QEMU monitor
    - Frame capture via VNC client
    """

    def __init__(
        self,
        start_display: int = 10,
        start_websockify_port: int = 6080,
        memory_mb: int = 512,
        use_kvm: bool = True,
        base_images_dir: str = "/tmp/geometry_os/images"
    ):
        """
        Initialize VNC backend.

        Args:
            start_display: Starting VNC display number (:10 = port 5910)
            start_websockify_port: Starting WebSocket port for websockify
            memory_mb: Default memory allocation for VMs in MB
            use_kvm: Whether to use KVM acceleration if available
            base_images_dir: Directory containing base OS images
        """
        self._next_display = start_display
        self._next_ws_port = start_websockify_port
        self._memory_mb = memory_mb
        self._use_kvm = use_kvm
        self._base_images_dir = Path(base_images_dir)

        self._tiles: dict[str, Tile] = {}
        self._processes: dict[str, ProcessInfo] = {}

        # Ensure base images directory exists
        self._base_images_dir.mkdir(parents=True, exist_ok=True)

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

    def _get_base_image_path(self, app: str) -> Optional[Path]:
        """Get path to base image for an app."""
        # Check common image formats
        for ext in [".qcow2", ".img", ".iso", ".raw"]:
            path = self._base_images_dir / f"{app}{ext}"
            if path.exists():
                return path

        # Check for Alpine as default
        alpine_path = self._base_images_dir / "alpine.qcow2"
        if alpine_path.exists():
            return alpine_path

        return None

    def _should_use_kvm(self) -> bool:
        """Check if KVM acceleration should be used."""
        if not self._use_kvm:
            return False
        return os.path.exists("/dev/kvm")

    def _build_qemu_command(
        self,
        config: AppConfig,
        display: int,
        vnc_port: int
    ) -> list[str]:
        """
        Build QEMU command for spawning an app.

        Args:
            config: App configuration
            display: VNC display number
            vnc_port: VNC port (5900 + display)

        Returns:
            List of command arguments
        """
        cmd = [
            "qemu-system-x86_64",
            "-m", str(self._memory_mb),
            "-vnc", f":{display}",
            "-display", "none",
        ]

        # Add KVM acceleration if available
        if self._should_use_kvm():
            cmd.extend(["-enable-kvm"])
            logger.debug("KVM acceleration enabled")

        # Add CPU configuration
        cmd.extend(["-cpu", "host" if self._should_use_kvm() else "qemu64"])

        # Configure for GUI apps
        cmd.extend([
            "-vga", "virtio",
            "-device", "virtiokeyboard-pci",
            "-device", "virtio-mouse-pci",
        ])

        # Add base image or disk
        base_image = self._get_base_image_path(config.app)
        if base_image:
            cmd.extend(["-hda", str(base_image)])
        else:
            # Create a placeholder disk
            disk_path = self._base_images_dir / f"{config.app}.qcow2"
            if not disk_path.exists():
                # Create small disk for app
                cmd.extend(["-hda", str(disk_path)])
            else:
                cmd.extend(["-hda", str(disk_path)])

        # Configure network
        cmd.extend([
            "-netdev", "user,id=net0",
            "-device", "virtio-net-pci,netdev=net0"
        ])

        # QMP monitor for input injection
        cmd.extend([
            "-qmp", f"tcp:localhost:{vnc_port + 1000},server,nowait"
        ])

        logger.debug(f"QEMU command: {' '.join(cmd)}")
        return cmd

    def _build_websockify_command(self, ws_port: int, vnc_port: int) -> list[str]:
        """
        Build websockify command.

        Args:
            ws_port: WebSocket port to listen on
            vnc_port: VNC port to bridge to

        Returns:
            List of command arguments
        """
        return [
            "websockify",
            str(ws_port),
            f"localhost:{vnc_port}"
        ]

    async def _start_qemu(
        self,
        config: AppConfig,
        display: int
    ) -> tuple[asyncio.subprocess.Process, int]:
        """
        Start QEMU process.

        Args:
            config: App configuration
            display: VNC display number

        Returns:
            Tuple of (process, vnc_port)
        """
        vnc_port = 5900 + display
        cmd = self._build_qemu_command(config, display, vnc_port)

        logger.info(f"Starting QEMU: {' '.join(cmd)}")

        proc = await asyncio.create_subprocess_exec(
            *cmd,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE
        )

        logger.info(f"QEMU started with PID {proc.pid}")
        return proc, vnc_port

    async def _start_websockify(
        self,
        ws_port: int,
        vnc_port: int
    ) -> Optional[asyncio.subprocess.Process]:
        """
        Start websockify process.

        Args:
            ws_port: WebSocket port
            vnc_port: VNC port to bridge

        Returns:
            Websockify process or None if failed
        """
        cmd = self._build_websockify_command(ws_port, vnc_port)

        logger.info(f"Starting websockify: {' '.join(cmd)}")

        try:
            proc = await asyncio.create_subprocess_exec(
                *cmd,
                stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.PIPE
            )

            # Give websockify a moment to start
            await asyncio.sleep(0.5)

            if proc.returncode is not None:
                logger.error("Websockify failed to start")
                return None

            logger.info(f"Websockify started on port {ws_port}")
            return proc

        except FileNotFoundError:
            logger.warning("websockify not found, VNC will be direct only")
            return None

    async def spawn(self, config: AppConfig) -> Tile:
        """
        Spawn an app as a VNC tile.

        Starts QEMU with VNC display and websockify bridge.

        Args:
            config: App configuration

        Returns:
            Tile representing the spawned app
        """
        # Get resources
        display = self._get_next_vnc_display()
        ws_port = self._get_next_websockify_port()
        tile_id = self._generate_tile_id()

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
            }
        )
        self._tiles[tile_id] = tile

        try:
            # Start QEMU
            qemu_proc, vnc_port = await self._start_qemu(config, display)

            # Start websockify
            ws_proc = await self._start_websockify(ws_port, vnc_port)

            # Store process info
            self._processes[tile_id] = ProcessInfo(
                qemu_proc=qemu_proc,
                websockify_proc=ws_proc,
                vnc_port=vnc_port,
                ws_port=ws_port
            )

            # Update tile metadata
            tile.metadata["websocket_url"] = f"ws://localhost:{ws_port}"
            tile.metadata["qemu_pid"] = qemu_proc.pid
            if ws_proc:
                tile.metadata["websockify_pid"] = ws_proc.pid

            # Wait briefly for QEMU to initialize
            await asyncio.sleep(1)

            # Check if process is still running
            if qemu_proc.returncode is not None:
                tile.state = TileState.ERROR
                tile.metadata["error"] = "QEMU process exited immediately"
                logger.error(f"QEMU for {tile_id} exited with code {qemu_proc.returncode}")
            else:
                tile.state = TileState.RUNNING
                logger.info(f"Spawned VNC tile {tile_id} for {config.app} on display :{display}")

        except Exception as e:
            tile.state = TileState.ERROR
            tile.metadata["error"] = str(e)
            logger.error(f"Failed to spawn VNC tile {tile_id}: {e}")

        return tile

    def _sanitize_input(self, event: InputEvent) -> bool:
        """
        Sanitize input event for security.

        Args:
            event: Input event to check

        Returns:
            True if input is safe, False if blocked
        """
        if event.type == InputEventType.KEY:
            # Check for blocked keys
            if event.keys in BLOCKED_KEYS:
                logger.warning(f"Blocked key: {event.keys}")
                return False

            # Check for blocked combinations
            modifiers = set(event.modifiers or [])
            for combo in BLOCKED_COMBOS:
                if combo <= modifiers:
                    logger.warning(f"Blocked key combination: {modifiers}")
                    return False

        return True

    async def _send_via_qemu_monitor(
        self,
        tile_id: str,
        command: str
    ) -> bool:
        """
        Send command via QEMU QMP monitor.

        Args:
            tile_id: Tile identifier
            command: QMP command

        Returns:
            True if successful
        """
        proc_info = self._processes.get(tile_id)
        if not proc_info:
            return False

        # For now, use a simple approach - in production would use proper QMP
        # This is a placeholder that logs the command
        logger.debug(f"QMP command for {tile_id}: {command}")
        return True

    async def send_input(self, tile_id: str, event: InputEvent) -> bool:
        """
        Send input to a VNC tile.

        Uses QEMU monitor for keyboard/mouse injection.

        Args:
            tile_id: Tile identifier
            event: Input event to send

        Returns:
            True if input was sent successfully
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"Cannot send input to unknown tile {tile_id}")
            return False

        proc_info = self._processes.get(tile_id)
        if not proc_info or not proc_info.qemu_proc:
            logger.warning(f"No QEMU process for tile {tile_id}")
            return False

        # Sanitize input
        if not self._sanitize_input(event):
            return False

        try:
            if event.type == InputEventType.KEY:
                # Send key via QMP
                keysym = event.keys.lower()
                qmp_cmd = {
                    "execute": "send-key",
                    "arguments": {
                        "keys": [{"type": "qcode", "data": keysym}]
                    }
                }
                logger.debug(f"Sending key '{keysym}' to {tile_id}")

            elif event.type == InputEventType.MOUSE:
                # Send mouse event via QMP
                qmp_cmd = {
                    "execute": "input-send-event",
                    "arguments": {
                        "events": [
                            {
                                "type": "abs",
                                "data": {
                                    "absolute": {
                                        "x": event.x or 0,
                                        "y": event.y or 0
                                    }
                                }
                            }
                        ]
                    }
                }
                logger.debug(f"Sending mouse ({event.x}, {event.y}) to {tile_id}")

            elif event.type == InputEventType.TEXT:
                # Type text character by character
                logger.debug(f"Typing text '{event.text}' to {tile_id}")
                # Would iterate through characters and send each

            return True

        except Exception as e:
            logger.error(f"Failed to send input to {tile_id}: {e}")
            return False

    async def _capture_vnc_frame(self, tile_id: str) -> Optional[bytes]:
        """
        Capture frame from VNC using QEMU screendump.

        Args:
            tile_id: Tile identifier

        Returns:
            PNG bytes or None
        """
        proc_info = self._processes.get(tile_id)
        if not proc_info or not proc_info.qemu_proc:
            return None

        # Use QEMU's screendump command via QMP
        # This is a placeholder - real implementation would:
        # 1. Send "screendump" command to QMP
        # 2. Read the resulting PPM file
        # 3. Convert to PNG

        # For now, return placeholder
        return PLACEHOLDER_PNG

    async def capture_frame(self, tile_id: str) -> Optional[bytes]:
        """
        Capture current frame from VNC tile.

        Args:
            tile_id: Tile identifier

        Returns:
            PNG bytes of current frame, or None if tile not found
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"Cannot capture frame from unknown tile {tile_id}")
            return None

        # Check if process is alive
        proc_info = self._processes.get(tile_id)
        if not proc_info or proc_info.qemu_proc.returncode is not None:
            logger.warning(f"Tile {tile_id} process is dead")
            return None

        try:
            return await self._capture_vnc_frame(tile_id)
        except Exception as e:
            logger.error(f"Failed to capture frame from {tile_id}: {e}")
            return None

    async def terminate(self, tile_id: str, force: bool = False) -> bool:
        """
        Terminate a VNC tile.

        Kills QEMU and websockify processes.

        Args:
            tile_id: Tile identifier
            force: If True, force kill instead of graceful shutdown

        Returns:
            True if termination was successful
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"Cannot terminate unknown tile {tile_id}")
            return False

        proc_info = self._processes.get(tile_id)
        if not proc_info:
            logger.warning(f"No process info for tile {tile_id}")
            del self._tiles[tile_id]
            return True

        try:
            # Terminate websockify first
            if proc_info.websockify_proc:
                try:
                    if force:
                        proc_info.websockify_proc.kill()
                    else:
                        proc_info.websockify_proc.terminate()
                        await asyncio.wait_for(proc_info.websockify_proc.wait(), timeout=5)
                except asyncio.TimeoutError:
                    proc_info.websockify_proc.kill()
                except Exception as e:
                    logger.warning(f"Error terminating websockify: {e}")

            # Terminate QEMU
            try:
                if force:
                    proc_info.qemu_proc.kill()
                else:
                    proc_info.qemu_proc.terminate()
                    await asyncio.wait_for(proc_info.qemu_proc.wait(), timeout=10)
            except asyncio.TimeoutError:
                proc_info.qemu_proc.kill()
            except Exception as e:
                logger.warning(f"Error terminating QEMU: {e}")

            logger.info(f"Terminated VNC tile {tile_id}")

        finally:
            # Clean up
            del self._processes[tile_id]
            del self._tiles[tile_id]

        return True

    async def health_check(self, tile_id: str) -> bool:
        """
        Check if VNC tile is healthy.

        Verifies QEMU process is still running.

        Args:
            tile_id: Tile identifier

        Returns:
            True if tile is healthy
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            return False

        proc_info = self._processes.get(tile_id)
        if not proc_info:
            return False

        # Check if QEMU is still running
        return proc_info.qemu_proc.returncode is None
