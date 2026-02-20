"""
Live Tile Service - Manages live VM instances for Neural City tiles.

This service coordinates with boot_bridge to start/stop QEMU instances
for "inhabited" buildings in the Neural City visualization.

Task 6 of Live Tile Integration Plan.
Task 3 of Distributed Neural Memory Plan (Phase 27).
"""
import asyncio
import logging
import time
import os
import random
from dataclasses import dataclass, field
from typing import Dict, Optional, Any, List
from pathlib import Path

# Import BootBridge for actual QEMU management
try:
    from systems.pixel_compiler.boot.boot_bridge import BootBridge
except ImportError:
    # Fallback for different environments
    try:
        from pixel_compiler.boot.boot_bridge import BootBridge
    except ImportError:
        BootBridge = None

# Import NeuralEvent and NeuralMemoryHub for distributed memory
from systems.evolution_daemon.neural_event import NeuralEvent, EventType
from systems.evolution_daemon.neural_memory_hub import get_neural_memory_hub

# Import ExtractionBridge for semantic UI analysis
from systems.evolution_daemon.extraction_bridge import get_extraction_bridge

# Import CloneOrchestrator for UI cloning
from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

logger = logging.getLogger("evolution_daemon.live_tile")


@dataclass
class LiveTileInstance:
    """Represents a running VM tile instance."""
    tile_id: str
    rts_path: str
    status: str = "stopped"  # stopped, booting, running, error
    bridge: Optional[Any] = None  # BootBridge instance
    process: Optional[asyncio.subprocess.Process] = None
    framebuffer: Optional[str] = None  # Base64 encoded screenshot
    framebuffer_width: int = 320
    framebuffer_height: int = 240
    metrics: Dict[str, Any] = field(default_factory=lambda: {
        "cpu": 0,
        "memory": 0,
        "uptime": 0
    })
    console_output: list = field(default_factory=list)
    boot_time: Optional[float] = None
    screenshot_task: Optional[asyncio.Task] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        return {
            "tile_id": self.tile_id,
            "rts_path": self.rts_path,
            "status": self.status,
            "metrics": self.metrics,
            "framebuffer_width": self.framebuffer_width,
            "framebuffer_height": self.framebuffer_height,
            "console_lines": len(self.console_output),
            "framebuffer": self.framebuffer
        }


class LiveTileService:
    """
    Service for managing live tile instances.
    Coordinates with boot_bridge for actual VM management.
    """

    def __init__(self):
        self.tiles: Dict[str, LiveTileInstance] = {}
        self._webmcp = None
        self._boot_callback = None
        self._vnc_offset = 10  # Start VNC displays at :10 to avoid conflicts
        self._memory_hub = get_neural_memory_hub()  # Neural memory integration
        self._last_shell_tokens: Dict[str, List[str]] = {}  # Track shell activity per tile
        self._extraction_bridge = get_extraction_bridge()  # Semantic extraction bridge
        self._clone_orchestrator = CloneOrchestrator()  # UI cloning orchestrator

    def set_webmcp(self, webmcp):
        """Set WebMCP instance for broadcasting events."""
        self._webmcp = webmcp
        self._extraction_bridge.set_webmcp(webmcp)
        logger.info("LiveTileService: WebMCP bridge connected")

    def set_boot_callback(self, callback):
        """Set callback for actual boot operations."""
        self._boot_callback = callback

    async def boot_tile(self, tile_id: str, rts_path: str) -> Dict[str, Any]:
        """
        Boot a tile from an RTS file using BootBridge.

        Args:
            tile_id: Unique identifier for the tile
            rts_path: Path to the .rts.png file

        Returns:
            Dict with tile_id and status
        """
        logger.info(f"🚀 Booting tile {tile_id} from {rts_path}")

        # Check if tile already exists
        if tile_id in self.tiles:
            existing = self.tiles[tile_id]
            if existing.status in ["booting", "running"]:
                return {"tile_id": tile_id, "status": "already_running"}

        # Resolve RTS path relative to project root if needed
        full_rts_path = Path(rts_path)
        if not full_rts_path.exists():
            # Try relative to zion root
            potential_path = Path("/home/jericho/zion/projects/geometry_os/geometry_os") / rts_path.lstrip("./")
            if potential_path.exists():
                full_rts_path = potential_path
            else:
                logger.warning(f"RTS file not found: {rts_path} (continuing anyway for tests/demo)")
                # Don't return error here to maintain test compatibility
                # in production, BootBridge will handle the missing file error

        # Create tile instance
        tile = LiveTileInstance(
            tile_id=tile_id,
            rts_path=str(full_rts_path),
            status="booting"
        )
        self.tiles[tile_id] = tile

        # Start boot process (async)
        asyncio.create_task(self._boot_process(tile_id, str(full_rts_path)))

        # Broadcast boot event
        await self._broadcast_event("tile_booted", {
            "tile_id": tile_id,
            "rts_path": str(full_rts_path),
            "status": "booting"
        })

        return {"tile_id": tile_id, "status": "booting"}

    async def _boot_process(self, tile_id: str, rts_path: str):
        """
        Execute the boot process for a tile using BootBridge.
        """
        tile = self.tiles.get(tile_id)
        if not tile:
            return

        if BootBridge is None:
            logger.error("BootBridge not available, cannot perform actual boot")
            tile.status = "error"
            return

        try:
            # Assign a unique VNC display
            display = self._vnc_offset + len(self.tiles)
            
            logger.debug(f"Tile {tile_id}: Initializing BootBridge on VNC :{display}")
            
            # Use BootBridge to orchestrate FUSE + QEMU
            bridge = BootBridge(
                rts_png_path=rts_path,
                memory="512M", # Minimal Alpine memory
                cpus=1,
                vnc_display=display
            )
            tile.bridge = bridge

            # Perform boot
            loop = asyncio.get_event_loop()
            result = await loop.run_in_executor(None, bridge.boot, "console=ttyS0 quiet")

            if not result.success:
                raise Exception(result.error_message or "Unknown boot error")

            # Check if tile still exists (not stopped during boot)
            if tile_id not in self.tiles:
                bridge.stop()
                return

            tile.status = "running"
            tile.boot_time = time.time()
            tile.console_output.append({
                "time": self._get_timestamp(),
                "text": "Alpine Linux booted via BootBridge"
            })
            tile.console_output.append({
                "time": self._get_timestamp(),
                "text": f"VNC Display: :{display} (Port {result.vnc_port})"
            })

            logger.info(f"✅ Tile {tile_id}: Running on PID {result.pid}")

            # Broadcast running event
            await self._broadcast_event("tile_booted", {
                "tile_id": tile_id,
                "status": "running",
                "vnc_port": result.vnc_port
            })

            # Start metrics and screenshot loops
            asyncio.create_task(self._metrics_loop(tile_id))
            tile.screenshot_task = asyncio.create_task(self._screenshot_loop(tile_id))

        except Exception as e:
            logger.error(f"❌ Tile {tile_id}: Boot failed - {e}")
            tile.status = "error"
            await self._broadcast_event("tile_error", {
                "tile_id": tile_id,
                "error": str(e)
            })

    async def _screenshot_loop(self, tile_id: str):
        """Periodically capture VM screenshot and run semantic extraction."""
        import base64
        from PIL import Image
        import io

        loop_count = 0
        while tile_id in self.tiles:
            tile = self.tiles[tile_id]
            if tile.status != "running" or not tile.bridge:
                break

            try:
                # Capture screenshot to temp file
                temp_png = Path(f"/tmp/tile_snap_{tile_id}.png")
                
                # QemuBoot's take_screenshot via bridge._qemu
                if tile.bridge._qemu:
                    loop = asyncio.get_event_loop()
                    success = await loop.run_in_executor(
                        None, tile.bridge._qemu.take_screenshot, temp_png
                    )
                    
                    if success and temp_png.exists():
                        # Read and encode to base64
                        with open(temp_png, "rb") as f:
                            encoded = base64.b64encode(f.read()).decode('utf-8')
                            tile.framebuffer = f"data:image/png;base64,{encoded}"
                        
                        # Broadcast framebuffer update
                        await self._broadcast_event("tile_framebuffer", {
                            "tile_id": tile_id,
                            "data": tile.framebuffer
                        })

                        # Run semantic extraction every 5 loops (approx every 10s)
                        loop_count += 1
                        if loop_count % 5 == 0:
                            asyncio.create_task(
                                self._extraction_bridge.extract_tile_semantics(tile_id, temp_png)
                            )
                        else:
                            # Cleanup temp file if not running extraction
                            if temp_png.exists():
                                temp_png.unlink()
            except Exception as e:
                logger.debug(f"Screenshot failed for {tile_id}: {e}")

            await asyncio.sleep(2)  # Update every 2 seconds for a "live" feel

    async def _metrics_loop(self, tile_id: str):
        """Periodically update tile metrics and capture neural events."""
        metrics_count = 0

        while tile_id in self.tiles:
            tile = self.tiles[tile_id]
            if tile.status != "running":
                break

            # Calculate uptime
            if tile.boot_time:
                tile.metrics["uptime"] = int(time.time() - tile.boot_time)

            # In production, we'd get real stats from QEMU monitor
            # For now, simulate jitter around real-ish values
            tile.metrics["cpu"] = 5 + (time.time() % 15)
            tile.metrics["memory"] = 128 + (time.time() % 32)

            # Broadcast metrics update
            await self._broadcast_event("tile_metrics", {
                "tile_id": tile_id,
                "metrics": tile.metrics
            })

            # Capture neural event every other metrics update (every 10s)
            metrics_count += 1
            if metrics_count % 2 == 0:
                try:
                    event = await self.capture_neural_event(tile_id, broadcast=True)
                    if event:
                        # Broadcast neural event for visualization
                        await self._broadcast_event("neural_event", event.to_dict())
                except Exception as e:
                    logger.debug(f"Neural event capture failed for {tile_id}: {e}")

            await asyncio.sleep(5)

    async def capture_neural_event(
        self,
        tile_id: str,
        shell_tokens: Optional[List[str]] = None,
        event_type: Optional[EventType] = None,
        broadcast: bool = True
    ) -> Optional[NeuralEvent]:
        """
        Capture a neural event from tile activity.

        This creates a hybrid symbolic/metabolic event that combines:
        - Symbolic layer: Shell commands/tokens
        - Metabolic layer: CPU, memory, IO metrics
        - Spatial layer: Position in neural city (if available)

        Args:
            tile_id: The tile generating the event
            shell_tokens: Optional shell command tokens (e.g., ["ls", "-la"])
            event_type: Optional event type override (auto-classified if None)
            broadcast: Whether to share with other tiles via memory hub

        Returns:
            The created NeuralEvent, or None if tile not found
        """
        tile = self.tiles.get(tile_id)
        if not tile:
            return None

        # Use provided shell tokens or generate from console history
        if shell_tokens is None:
            # Extract from recent console output
            recent = tile.console_output[-3:] if tile.console_output else []
            shell_tokens = []
            for line in recent:
                text = line.get("text", "")
                if text.startswith("> "):
                    # This is a command input
                    shell_tokens.extend(text[2:].split()[:3])  # First 3 tokens

        # Calculate CPU jitter (variation in CPU usage)
        cpu_jitter = 0.1 + random.uniform(-0.05, 0.15)
        if tile.metrics.get("cpu"):
            cpu_jitter = abs(tile.metrics["cpu"] - 10) / 100  # Normalized deviation

        # Get memory delta
        memory_delta = tile.metrics.get("memory", 128)
        last_memory = getattr(tile, '_last_memory', 128)
        memory_delta = memory_delta - last_memory
        tile._last_memory = tile.metrics.get("memory", 128)

        # Get IO frequency from console activity
        console_count = len(tile.console_output)
        last_count = getattr(tile, '_last_console_count', 0)
        io_frequency = console_count - last_count
        tile._last_console_count = console_count

        # Create the neural event
        event = NeuralEvent(
            tile_id=tile_id,
            shell_tokens=shell_tokens,
            cpu_jitter=cpu_jitter,
            memory_delta=memory_delta,
            io_frequency=float(io_frequency),
            broadcast=broadcast
        )

        # Override event type if provided
        if event_type:
            event.event_type = event_type

        # Store in memory hub
        await self._memory_hub.store_event(event)

        logger.debug(f"Neural event captured for {tile_id}: type={event.event_type.name}")

        return event

    async def get_collective_context(self, tile_id: str) -> Dict[str, Any]:
        """
        Get collective context from the neural memory hub.

        Returns relevant memories from other tiles that might help
        the requesting tile understand the collective state.

        Args:
            tile_id: The tile requesting context

        Returns:
            Dict with recent_events, similar_tiles, and similar_events
        """
        context = await self._memory_hub.get_collective_context(
            tile_id,
            context_limit=5
        )
        return context

    async def clone_tile(self, tile_id: str, target_name: str) -> Dict[str, Any]:
        """
        Clone a tile's extracted UI into a native WGSL shader.

        This uses the CloneOrchestrator to transform the tile's last
        extraction result into a standalone WGSL shader that can run
        without the VM.

        Args:
            tile_id: ID of the tile to clone
            target_name: Name for the cloned output file

        Returns:
            Dict with task_id and status, or error if tile not found
        """
        tile = self.tiles.get(tile_id)
        if not tile:
            return {
                "tile_id": tile_id,
                "status": "error",
                "error": f"Tile {tile_id} not found"
            }

        # Check for extraction data
        extraction = getattr(tile, 'last_extraction', None)
        if not extraction:
            return {
                "tile_id": tile_id,
                "status": "error",
                "error": f"Tile {tile_id} has no extraction data. Run extraction first."
            }

        logger.info(f"🔄 Cloning tile {tile_id} -> {target_name}")

        # Request clone through orchestrator
        task_id = self._clone_orchestrator.request_clone(
            source_tile_id=tile_id,
            extraction_result=extraction,
            target_name=target_name
        )

        # Execute the clone
        try:
            self._clone_orchestrator._execute_clone(task_id)
            task = self._clone_orchestrator.get_task(task_id)

            if task.status == "completed":
                logger.info(f"✅ Clone complete: {task.output_path}")
                return {
                    "task_id": task_id,
                    "status": "completed",
                    "output_path": str(task.output_path)
                }
            else:
                return {
                    "task_id": task_id,
                    "status": "failed",
                    "error": task.error
                }
        except Exception as e:
            logger.error(f"❌ Clone failed: {e}")
            return {
                "task_id": task_id,
                "status": "failed",
                "error": str(e)
            }

    async def stop_tile(self, tile_id: str) -> Dict[str, Any]:
        """Stop a running tile and cleanup BootBridge."""
        logger.info(f"🛑 Stopping tile {tile_id}")

        tile = self.tiles.get(tile_id)
        if not tile:
            return {"tile_id": tile_id, "status": "not_found"}

        # Cancel screenshot task
        if tile.screenshot_task:
            tile.screenshot_task.cancel()

        # Stop BootBridge (handles QEMU and FUSE unmount)
        if tile.bridge:
            loop = asyncio.get_event_loop()
            await loop.run_in_executor(None, tile.bridge.stop)
            tile.bridge = None

        tile.status = "stopped"
        tile.console_output.append({
            "time": self._get_timestamp(),
            "text": "System halted and unmounted"
        })

        # Broadcast stop event
        await self._broadcast_event("tile_stopped", {
            "tile_id": tile_id
        })

        return {"tile_id": tile_id, "status": "stopped"}

    async def get_framebuffer(self, tile_id: str) -> Optional[Dict[str, Any]]:
        """Get current framebuffer (base64) for a tile."""
        tile = self.tiles.get(tile_id)
        if not tile or not tile.framebuffer:
            return None

        return {
            "tile_id": tile_id,
            "width": tile.framebuffer_width,
            "height": tile.framebuffer_height,
            "data": tile.framebuffer
        }

    async def get_tile_info(self, tile_id: str) -> Optional[Dict[str, Any]]:
        """Get information about a tile."""
        tile = self.tiles.get(tile_id)
        return tile.to_dict() if tile else None

    async def list_tiles(self) -> list:
        """List all tiles."""
        return [tile.to_dict() for tile in self.tiles.values()]

    async def send_console_input(self, tile_id: str, input_text: str) -> Dict[str, Any]:
        """Send input to tile console via QEMU monitor/serial."""
        tile = self.tiles.get(tile_id)
        if not tile:
            return {"tile_id": tile_id, "status": "not_found"}

        if tile.status != "running" or not tile.bridge:
            return {"tile_id": tile_id, "status": "not_running"}

        # Log the input
        tile.console_output.append({
            "time": self._get_timestamp(),
            "text": f"> {input_text}"
        })

        # Send to QEMU via BootBridge -> QemuBoot -> monitor
        if tile.bridge._qemu:
            loop = asyncio.get_event_loop()
            
            # Check for special 'click x y' command
            if input_text.startswith("click "):
                try:
                    _, x_str, y_str = input_text.split()
                    # QEMU usb-tablet uses 0-32767 scale.
                    # Assuming input is normalized 0-1000 or similar? 
                    # Actually let's assume raw pixels if coming from OCR.
                    # We might need to scale based on framebuffer dimensions.
                    x = float(x_str)
                    y = float(y_str)
                    
                    # Scaling logic: input is in VM pixel space
                    # Scale to QEMU absolute range (0-32767)
                    qx = int((x / tile.framebuffer_width) * 32767)
                    qy = int((y / tile.framebuffer_height) * 32767)
                    
                    def perform_click():
                        tile.bridge._qemu.mouse_move(qx, qy)
                        time.sleep(0.1)
                        tile.bridge._qemu.mouse_click(1) # Left click
                        
                    await loop.run_in_executor(None, perform_click)
                except Exception as e:
                    logger.error(f"Failed to perform click for {tile_id}: {e}")
            else:
                # Normal text input
                await loop.run_in_executor(
                    None, tile.bridge._qemu.send_keys, input_text + "\n"
                )

        logger.debug(f"Tile {tile_id}: Console input sent: {input_text}")

        return {"tile_id": tile_id, "status": "sent"}

    async def handle_rpc(self, method: str, params: Dict) -> Any:
        """Handle RPC method calls."""
        if method == "boot_tile":
            return await self.boot_tile(
                params.get("tile_id"),
                params.get("rts_path")
            )
        elif method == "stop_tile":
            return await self.stop_tile(params.get("tile_id"))
        elif method == "get_tile_info":
            return await self.get_tile_info(params.get("tile_id"))
        elif method == "list_tiles":
            return await self.list_tiles()
        elif method == "send_console_input":
            return await self.send_console_input(
                params.get("tile_id"),
                params.get("input", "")
            )
        elif method == "capture_neural_event":
            event = await self.capture_neural_event(
                params.get("tile_id"),
                shell_tokens=params.get("shell_tokens"),
                broadcast=params.get("broadcast", True)
            )
            return event.to_dict() if event else None
        elif method == "get_collective_context":
            return await self.get_collective_context(params.get("tile_id"))
        elif method == "clone_tile":
            return await self.clone_tile(
                params.get("tile_id"),
                params.get("target_name", "cloned_panel")
            )
        else:
            raise ValueError(f"Unknown method: {method}")

    async def _broadcast_event(self, event_type: str, data: Dict[str, Any]):
        """Broadcast event via WebMCP."""
        if self._webmcp:
            try:
                await self._webmcp.broadcast_event(event_type, data)
            except Exception as e:
                logger.warning(f"Failed to broadcast event: {e}")
        else:
            logger.debug(f"Event (no WebMCP): {event_type} -> {data}")

    def _get_timestamp(self) -> str:
        """Get current timestamp in HH:MM:SS format."""
        from datetime import datetime
        return datetime.now().strftime("%H:%M:%S")


# Module-level service instance for convenience
_service: Optional[LiveTileService] = None


def get_live_tile_service() -> LiveTileService:
    """Get the global LiveTileService instance."""
    global _service
    if _service is None:
        _service = LiveTileService()
    return _service
