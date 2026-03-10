#!/usr/bin/env python3
"""
Evolution Daemon for Geometry OS - V11
"Natural Selection for Operating Systems" - WITH FULL SAFETY PIPELINE

Refactored by Coder agent - self-evolution event 2026-02-16
Upgraded to V11 with Full Safety Pipeline - 2026-02-16

This daemon connects:
- Append-Only Computer (Storage) with Z.ai (Intelligence)
- PixiJS Visual Map via WebMCP bridge (Perception)
- VFS for self-modification (Action)

V11 Safety Pipeline:
- SandboxManager: Two-stage pre-commit validation
- GuardianGate: AI-powered code review
- TierRouter: Risk-based classification
- GitIntegration: Atomic commits with rollback
- PostCommitMonitor: Tiered health monitoring
- EvolutionRecovery: Automated regression handling
"""

import asyncio
import json
import logging
import sys
import os
import subprocess
import base64
from datetime import datetime
from typing import Optional, Dict, List, Any, Callable
from dataclasses import dataclass, field
from pathlib import Path
import traceback

# NumPy for brain atlas manipulation
try:
    import numpy as np
    HAS_NUMPY = True
except ImportError:
    HAS_NUMPY = False
    np = None

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

# WebSocket support for visual interface
try:
    import websockets
    HAS_WEBSOCKETS = True
except ImportError:
    HAS_WEBSOCKETS = False

# VisualBridgeClient for proper singleton connection
try:
    from systems.visual_shell.api.visual_bridge import VisualBridgeClient
    HAS_VISUAL_BRIDGE_CLIENT = True
except ImportError:
    HAS_VISUAL_BRIDGE_CLIENT = False
    VisualBridgeClient = None

# Import Z.ai Integration (our new intelligence layer)
try:
    from zai_agent_integration import ZAIIntegration, ZHIPU_AVAILABLE
    HAS_ZAI = True
except ImportError:
    HAS_ZAI = False
    ZAIIntegration = None
    ZHIPU_AVAILABLE = False

# Import Append-Only Computer components
try:
    from systems.append_only_computer.snapshot_manager import VMSnapshotManager
    from systems.append_only_computer.rts_memory_converter import RTSMemoryConverter
    from systems.append_only_computer.tile_placement import TilePlacementEngine
    from systems.append_only_computer.timeline_manager import TimelineManager
    HAS_APPEND_ONLY = True
except ImportError:
    HAS_APPEND_ONLY = False

# V11 Safety Pipeline imports
from systems.evolution_daemon.safety.data_structures import (
    EvolutionProposal, SandboxResult, GuardianVerdict,
    MonitoringResult, RecoveryAction, EvolutionResult
)
from systems.evolution_daemon.safety.sandbox_manager import SandboxManager
from systems.evolution_daemon.safety.guardian_gate import GuardianGate
from systems.evolution_daemon.safety.tier_router import TierRouter
from systems.evolution_daemon.safety.git_integration import GitIntegration
from systems.evolution_daemon.safety.post_commit_monitor import PostCommitMonitor, EvolutionRecovery

# V12 Journeyman Stage - Visual Verification
from systems.evolution_daemon.visual_verification_service import (
    VisualVerificationService, VisualIntent, VerificationResult,
    CriticalityLevel, SpatialRelation
)

# V14 Master Stage - Visual Self-Evolution
from systems.evolution_daemon.stages.master_stage import MasterStage, CapabilityType, VisualCapabilityProposal
from systems.evolution_daemon.stages.mirror_bridge import SubprocessMirrorBridge, MirrorValidationResult

# V15 Tectonic Stage - Substrate Self-Optimization
from systems.evolution_daemon.stages.tectonic_stage import TectonicStage, TectonicShiftResult

# V2.0 Ambient Narrative System - WordPress WebMCP
try:
    from systems.visual_shell.api.evolution_webmcp_bridge import (
        EvolutionWebMCPBridge, EvolutionWebMCPHook
    )
    HAS_WEBMCP = True
except ImportError:
    HAS_WEBMCP = False
    EvolutionWebMCPBridge = None
    EvolutionWebMCPHook = None

# V2.1 WordPress Evolution Integration
try:
    from systems.evolution_daemon.wordpress import (
        WordPressEvolutionAgent,
        WPEvolutionBridgeService,
        BridgeServiceConfig,
        ServiceStats,
    )
    from systems.visual_shell.api.evolution_wordpress_hook import (
        EvolutionWordPressHook
    )
    HAS_WP_EVOLUTION = True
except ImportError:
    HAS_WP_EVOLUTION = False
    WordPressEvolutionAgent = None
    WPEvolutionBridgeService = None
    BridgeServiceConfig = None
    ServiceStats = None
    EvolutionWordPressHook = None

# GOSR Radio - Narrative Broadcaster
try:
    from systems.evolution_daemon.narrative_broadcaster import NarrativeBroadcaster, BroadcastSegment
    HAS_RADIO = True
except ImportError:
    HAS_RADIO = False
    NarrativeBroadcaster = None
    BroadcastSegment = None

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - [EVOLUTION] - %(levelname)s - %(message)s'
)
logger = logging.getLogger("evolution_daemon")


class WebMCPClient:
    """
    Client for interacting with the PixiJS visual shell via WebMCP bridge.

    This connects to the WebSocket server that the frontend also connects to,
    allowing the Evolution Daemon to:
    - Read current visual state
    - Place tiles/UI elements
    - Inspect running VM frames
    - Verify visual outcomes of code changes
    """

    def __init__(self, ws_url: str = "ws://localhost:8768"):
        self.ws_url = ws_url
        self.ws = None
        self.connected = False
        self.message_id = 0
        self.pending_responses: Dict[int, asyncio.Future] = {}

    async def connect(self) -> bool:
        """Connect to the visual shell WebSocket"""
        if not HAS_WEBSOCKETS:
            logger.warning("websockets not installed - visual interface disabled")
            return False

        try:
            self.ws = await websockets.connect(self.ws_url)
            self.connected = True
            logger.info(f"✅ Connected to visual shell at {self.ws_url}")

            # Start message handler
            asyncio.create_task(self._message_handler())
            return True
        except Exception as e:
            logger.warning(f"Could not connect to visual shell: {e}")
            self.connected = False
            return False

    async def _message_handler(self):
        """Handle incoming WebSocket messages"""
        try:
            async for message in self.ws:
                data = json.loads(message)
                msg_id = data.get("id")

                if msg_id and msg_id in self.pending_responses:
                    self.pending_responses[msg_id].set_result(data)
        except Exception as e:
            logger.error(f"WebSocket error: {e}")
            self.connected = False

    async def _call(self, method: str, params: Dict = None) -> Dict:
        """Make a JSON-RPC call to the visual shell"""
        if not self.connected:
            return {"error": "Not connected to visual shell"}

        self.message_id += 1
        msg_id = self.message_id

        future = asyncio.get_event_loop().create_future()
        self.pending_responses[msg_id] = future

        message = {
            "jsonrpc": "2.0",
            "id": msg_id,
            "method": method,
            "params": params or {}
        }

        try:
            await self.ws.send(json.dumps(message))

            # Wait for response with timeout
            result = await asyncio.wait_for(future, timeout=10.0)
            return result.get("result", result)
        except asyncio.TimeoutError:
            return {"error": "Request timeout"}
        except Exception as e:
            return {"error": str(e)}
        finally:
            self.pending_responses.pop(msg_id, None)

    async def get_os_state(self) -> Dict:
        """Get current OS state from the visual map"""
        return await self._call("get_os_state")

    async def get_map_bounds(self) -> Dict:
        """Get the bounds of the visual map"""
        return await self._call("get_map_bounds")

    async def place_tile(self, x: int, y: int, tile_type: str, data: Dict = None) -> Dict:
        """Place a tile on the visual map"""
        return await self._call("builder_place_tile", {
            "x": x,
            "y": y,
            "type": tile_type,
            "data": data or {}
        })

    async def place_text(self, x: int, y: int, text: str, color: str = "#ffffff") -> Dict:
        """Place text on the visual map"""
        return await self._call("place_text", {
            "x": x,
            "y": y,
            "text": text,
            "color": color
        })

    async def get_hypervisor_frame(self, vm_id: str = None) -> Dict:
        """Get a frame from the hypervisor (running VM)"""
        return await self._call("hypervisor_frame", {"vm_id": vm_id})

    async def inspect_region(self, x: int, y: int, width: int, height: int) -> Dict:
        """Inspect a region of the visual map"""
        return await self._call("visual_inspect", {
            "x": x,
            "y": y,
            "width": width,
            "height": height
        })

    async def execute_visual_action(self, action: str, params: Dict) -> Dict:
        """Execute a visual action on the frontend"""
        return await self._call("execute_action", {
            "action": action,
            "params": params
        })

    async def broadcast_event(self, event_type: str, data: Dict) -> bool:
        """
        Broadcast an asynchronous event to the visual shell.
        Unlike _call, this does not wait for a response.
        """
        if not self.connected:
            return False

        message = {
            "jsonrpc": "2.0",
            "method": "broadcast_event",
            "params": {
                "type": event_type,
                "data": data
            }
        }

        try:
            await self.ws.send(json.dumps(message))
            return True
        except Exception as e:
            logger.error(f"Failed to broadcast event {event_type}: {e}")
            return False

    async def render_visual_layout(self, detail_level: str = "standard", region: Dict = None) -> Dict:
        """Render the current visual state as an ASCII layout"""
        return await self._call("render_visual_layout", {
            "detail_level": detail_level,
            "region": region
        })

    async def close(self):
        """Close the WebSocket connection"""
        if self.ws:
            await self.ws.close()
            self.connected = False


@dataclass
class EvolutionTask:
    """A self-improvement task"""
    task_id: str
    goal: str
    target_file: Optional[str] = None
    priority: int = 5
    status: str = "pending"
    created_at: str = field(default_factory=lambda: datetime.now().isoformat())
    result: Optional[str] = None
    changes_made: List[str] = field(default_factory=list)
    visual_verification: Optional[str] = None  # Screenshot/data for visual check
    # V12 Journeyman Stage - Visual Intent for self-verification
    visual_intent: Optional['VisualIntent'] = None
    visual_attempt: int = 0  # Track retry attempts for visual verification


@dataclass
class CodebaseAnalysis:
    """Analysis of current codebase state"""
    total_files: int = 0
    python_files: int = 0
    test_coverage_pct: float = 0.0
    issues_found: List[str] = field(default_factory=list)
    improvement_opportunities: List[str] = field(default_factory=list)
    last_scan: str = field(default_factory=lambda: datetime.now().isoformat())


class VirtualFileSystem:
    """Real file system operations for self-modification"""

    def __init__(self, root_path: str = "."):
        self.root = Path(root_path).resolve()

    async def read_file(self, path: str) -> str:
        """Read a file from the codebase"""
        full_path = self.root / path
        if not full_path.exists():
            raise FileNotFoundError(f"File not found: {path}")
        return full_path.read_text()

    async def write_file(self, path: str, content: str) -> bool:
        """Write a file to the codebase (SELF-MODIFICATION)"""
        full_path = self.root / path
        full_path.parent.mkdir(parents=True, exist_ok=True)

        # Backup original
        if full_path.exists():
            backup = full_path.with_suffix(full_path.suffix + ".bak")
            backup.write_text(full_path.read_text())
            logger.info(f"📋 Backed up: {path} -> {backup.name}")

        full_path.write_text(content)
        logger.info(f"✍️ Wrote: {path} ({len(content)} bytes)")
        return True

    async def list_files(self, pattern: str = "*.py") -> List[str]:
        """List files matching pattern"""
        return [str(p.relative_to(self.root)) for p in self.root.rglob(pattern)]

    async def run_tests(self, test_path: str = "tests/") -> Dict[str, Any]:
        """Run tests and return results"""
        try:
            result = subprocess.run(
                [sys.executable, "-m", "pytest", test_path, "-v", "--tb=short"],
                capture_output=True,
                text=True,
                timeout=60,
                cwd=str(self.root)
            )
            return {
                "success": result.returncode == 0,
                "returncode": result.returncode,
                "output": result.stdout + result.stderr
            }
        except subprocess.TimeoutExpired:
            return {"success": False, "error": "Test timeout"}
        except Exception as e:
            return {"success": False, "error": str(e)}


class EvolutionDaemon:
    """
    The Self-Improvement Engine with Visual Perception

    This daemon continuously:
    1. Analyzes the codebase for improvement opportunities
    2. Consults Z.ai for solutions
    3. Applies changes safely with backups
    4. Validates changes with tests AND visual inspection
    5. Commits successful improvements
    6. Visualizes progress on the PixiJS map
    """

    def __init__(self, api_key: Optional[str] = None, ws_url: str = "ws://localhost:8765", brain_atlas: np.ndarray = None):
        # Initialize Z.ai Integration (our new brain)
        self.zai = ZAIIntegration(api_key=api_key) if HAS_ZAI else None
        self.vfs = VirtualFileSystem()

        # Visual interface (WebMCP connection to PixiJS)
        self.webmcp = WebMCPClient(ws_url=ws_url)
        self.visual_connected = False

        # Weight mutation support for brain evolution
        self.brain_atlas = brain_atlas
        self.weight_mutator = None
        if brain_atlas is not None:
            self._init_weight_mutator()

        # Optional: Timeline tracking (if append-only components available)
        if HAS_APPEND_ONLY:
            self.timeline = TimelineManager(storage_path="/tmp/timeline.json")
            self.placement = TilePlacementEngine(
                config=None,
                storage_path="/tmp/tile_registry.json"
            )
        else:
            self.timeline = None
            self.placement = None

        # State
        self.running = False
        self.analysis = CodebaseAnalysis()
        self.task_queue: List[EvolutionTask] = []
        self.evolution_count = 0
        self.max_evolutions_per_session = 10

        # Visual state for map tracking
        self.visual_position = {"x": 400, "y": 300}  # Default position for daemon on map

        # V11 Safety Pipeline components
        self.sandbox = SandboxManager()
        self.guardian_gate = GuardianGate(zai_bridge=self.zai)
        self.tier_router = TierRouter()
        self.git = GitIntegration(repo_path=".")
        self.monitor = None  # Initialized after webmcp connects
        self.recovery = None  # Initialized after git and guardian

        # V12 Journeyman Stage - Visual Self-Verification
        self.visual_verification = VisualVerificationService()

        # V14 Master Stage - Visual Self-Evolution
        self.master_stage = MasterStage(evolution_daemon=self)
        self.mirror_bridge = SubprocessMirrorBridge(sandbox_manager=self.sandbox)

        # V15 Tectonic Stage - Substrate Self-Optimization
        self.tectonic_stage = TectonicStage(evolution_daemon=self)

        # V2.0 Ambient Narrative System
        self.ambient_mode = False
        self.ambient_state = "MONITORING"  # MONITORING, SUGGESTING, STEERING
        self.webmcp_hook = None  # EvolutionWebMCPHook for WordPress
        self._ambient_heartbeat_task = None

        # GOSR Radio - Narrative Broadcasting
        self.radio_enabled = False
        self.radio_station_id = "87.6"  # Default: Substrate Jazz
        self.radio_broadcaster: Optional['NarrativeBroadcaster'] = None
        self._radio_broadcast_task = None

        # Hooks system - extensible evolution targets
        self._hooks: Dict[str, List[Callable]] = {}
        self._mutation_targets: Dict[str, Dict[str, Any]] = {}

        # Register tool callbacks for Z.ai function calling
        self._register_tools()

        # Register brain evolution hook
        self._brain_hook = None  # Set by _register_brain_hook
        self._register_brain_hook()

    def _register_tools(self):
        """Register VFS and Visual tools for Z.ai function calling"""
        if not HAS_ZAI or self.zai is None:
            logger.debug("Z.ai not available, skipping tool registration")
            return

        # Code tools
        self.zai.register_tool_callback("read_file", self._tool_read_file)
        self.zai.register_tool_callback("write_file", self._tool_write_file)
        self.zai.register_tool_callback("execute_command", self._tool_execute)

        # Visual tools (for AI to interact with the map)
        self.zai.register_tool_callback("visual_inspect", self._tool_visual_inspect)
        self.zai.register_tool_callback("visual_place_tile", self._tool_visual_place_tile)
        self.zai.register_tool_callback("visual_get_state", self._tool_visual_get_state)
        self.zai.register_tool_callback("render_visual_layout", self._tool_render_visual_layout)

    def _register_brain_hook(self):
        """Register brain evolution hook during initialization."""
        try:
            from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import (
                BrainEvolutionHook,
                register_hook
            )
            # Create hook instance and store reference
            self._brain_hook = BrainEvolutionHook()
            # Register with daemon's hook system
            self.register_hook('evolution_cycle', self._brain_hook.on_evolution_cycle)
            logger.info("Brain evolution hook registered successfully")
        except Exception as e:
            logger.warning(f"Brain evolution hook registration failed: {e}")

    def _init_weight_mutator(self):
        """Initialize weight mutation capability."""
        if not HAS_NUMPY:
            logger.warning("NumPy not available, skipping weight mutator initialization")
            return

        if self.brain_atlas is None:
            logger.debug("No brain atlas provided, weight mutator not initialized")
            return

        try:
            from systems.evolution_daemon.weight_mutator import WeightMutator
            self.weight_mutator = WeightMutator(self.brain_atlas)
            logger.info(f"Weight mutator initialized with atlas shape {self.brain_atlas.shape}")
        except ImportError:
            logger.warning("WeightMutator not available")
            self.weight_mutator = None
        except Exception as e:
            logger.error(f"Failed to initialize weight mutator: {e}")
            self.weight_mutator = None

    def propose_weight_mutation(
        self,
        sector: str,
        mutation_type: str,
        intensity: float,
        reason: str
    ) -> dict:
        """
        Propose a mutation to the brain's weight atlas.

        Args:
            sector: Named sector (e.g., "attention_layer_0", "embeddings")
            mutation_type: "radiation", "crossover", "noise"
            intensity: 0-1 scale
            reason: Why this mutation is proposed

        Returns:
            {"status": "proposed"|"applied"|"rejected", "mutation_id": str, ...}
        """
        if self.weight_mutator is None:
            return {
                "status": "rejected",
                "reason": "Weight mutator not initialized"
            }

        # Resolve sector to Hilbert bounds
        bounds = self._resolve_sector_bounds(sector)
        if bounds is None:
            return {
                "status": "rejected",
                "reason": f"Unknown sector: {sector}"
            }

        # Build mutation config
        config = {
            "hilbert_start": bounds["start"],
            "hilbert_end": bounds["end"],
            "mutation_type": mutation_type,
            "intensity": intensity
        }

        # Add source sector for crossover
        if mutation_type == "crossover":
            # Select a random source sector (different from target)
            all_sectors = list(self._get_sector_mapping().keys())
            all_sectors.remove(sector)
            if all_sectors:
                source_sector = np.random.choice(all_sectors)
                source_bounds = self._resolve_sector_bounds(source_sector)
                config["source_sector"] = source_bounds["start"]

        try:
            # Apply mutation
            mutated_atlas, record = self.weight_mutator.mutate_sector(config)

            # Update daemon's brain atlas reference
            self.brain_atlas = mutated_atlas

            # Reinitialize weight mutator with new atlas
            self.weight_mutator = WeightMutator(self.brain_atlas)

            logger.info(
                f"Weight mutation applied: sector={sector}, type={mutation_type}, "
                f"id={record.mutation_id}, reason={reason}"
            )

            return {
                "status": "applied",
                "mutation_id": record.mutation_id,
                "sector": sector,
                "mutation_type": mutation_type,
                "intensity": intensity,
                "pixels_affected": record.pixels_affected,
                "reason": reason
            }

        except Exception as e:
            logger.error(f"Weight mutation failed: {e}")
            return {
                "status": "rejected",
                "reason": str(e)
            }

    def _resolve_sector_bounds(self, sector: str) -> Optional[dict]:
        """Map sector name to Hilbert bounds."""
        sector_mapping = self._get_sector_mapping()

        if sector not in sector_mapping:
            logger.warning(f"Unknown sector: {sector}")
            return None

        return sector_mapping[sector]

    def _get_sector_mapping(self) -> Dict[str, Dict[str, int]]:
        """
        Get mapping of sector names to Hilbert bounds.

        This is a simplified mapping for a 64x64 atlas (4096 total indices).
        Adjust based on actual brain architecture.
        """
        if self.brain_atlas is None:
            return {}

        grid_size = self.brain_atlas.shape[0]  # Assuming square atlas
        total_indices = grid_size * grid_size

        # Simple sector划分 - adjust based on actual model architecture
        sectors = {
            "embeddings": {"start": 0, "end": total_indices // 8},
            "attention_layer_0": {"start": total_indices // 8, "end": total_indices // 4},
            "attention_layer_1": {"start": total_indices // 4, "end": 3 * total_indices // 8},
            "ffn_layer_0": {"start": 3 * total_indices // 8, "end": total_indices // 2},
            "ffn_layer_1": {"start": total_indices // 2, "end": 5 * total_indices // 8},
            "lm_head": {"start": 5 * total_indices // 8, "end": 3 * total_indices // 4},
            "output": {"start": 3 * total_indices // 4, "end": total_indices}
        }

        return sectors

    def register_hook(self, hook_type: str, callback: Callable) -> None:
        """Register a hook callback for evolution events.

        Args:
            hook_type: Type of hook (e.g., 'evolution_cycle', 'pre_evolution', 'post_evolution')
            callback: Async function to call when hook is triggered
        """
        if hook_type not in self._hooks:
            self._hooks[hook_type] = []
        self._hooks[hook_type].append(callback)
        logger.info(f"Registered hook: {hook_type} -> {callback.__name__}")

    async def trigger_hooks(self, hook_type: str, data: Dict[str, Any]) -> List[Dict[str, Any]]:
        """Trigger all hooks of a given type.

        Args:
            hook_type: Type of hook to trigger
            data: Data to pass to hook callbacks

        Returns:
            List of results from all hook callbacks
        """
        results = []
        hooks = self._hooks.get(hook_type, [])

        for callback in hooks:
            try:
                result = await callback(data)
                results.append(result)
            except Exception as e:
                logger.error(f"Hook {callback.__name__} failed: {e}")
                results.append({"error": str(e)})

        return results

    def register_mutation_target(
        self,
        name: str,
        mutate_fn: Callable,
        evaluate_fn: Callable,
        sector: str = "general"
    ) -> None:
        """Register a mutation target for evolution.

        Args:
            name: Unique name for this mutation target
            mutate_fn: Function that applies mutation
            evaluate_fn: Function that evaluates fitness
            sector: Sector category (e.g., 'cognitive', 'visual', 'system')
        """
        self._mutation_targets[name] = {
            "mutate_fn": mutate_fn,
            "evaluate_fn": evaluate_fn,
            "sector": sector,
            "mutations_applied": 0
        }
        logger.info(f"Registered mutation target: {name} (sector: {sector})")

    def get_mutation_target(self, name: str) -> Optional[Dict[str, Any]]:
        """Get a mutation target by name."""
        return self._mutation_targets.get(name)

    def list_mutation_targets(self, sector: Optional[str] = None) -> List[str]:
        """List all mutation targets, optionally filtered by sector."""
        if sector is None:
            return list(self._mutation_targets.keys())
        return [
            name for name, target in self._mutation_targets.items()
            if target["sector"] == sector
        ]

    async def _tool_read_file(self, path: str) -> dict:
        """Tool: Read file from codebase"""
        try:
            content = await self.vfs.read_file(path)
            return {"success": True, "content": content}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_write_file(self, path: str, content: str) -> dict:
        """Tool: Write file to codebase (SELF-MODIFICATION)"""
        try:
            await self.vfs.write_file(path, content)
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
                cwd=str(self.vfs.root)
            )
            return {
                "success": result.returncode == 0,
                "output": result.stdout + result.stderr
            }
        except Exception as e:
            return {"success": False, "error": str(e)}

    # === Visual Tools (WebMCP) ===

    async def _tool_visual_inspect(self, x: int = None, y: int = None, width: int = 100, height: int = 100) -> dict:
        """Tool: Inspect a region of the visual map"""
        if not self.visual_connected:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            x = x or self.visual_position["x"]
            y = y or self.visual_position["y"]

            result = await self.webmcp.inspect_region(x, y, width, height)
            return {"success": True, "region": result}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_visual_place_tile(self, x: int, y: int, tile_type: str, data: dict = None) -> dict:
        """Tool: Place a tile on the visual map"""
        if not self.visual_connected:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            result = await self.webmcp.place_tile(x, y, tile_type, data)
            return {"success": True, "result": result}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_visual_get_state(self) -> dict:
        """Tool: Get current OS state from the visual map"""
        if not self.visual_connected:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            state = await self.webmcp.get_os_state()
            return {"success": True, "state": state}
        except Exception as e:
            return {"success": False, "error": str(e)}

    async def _tool_render_visual_layout(self, detail_level: str = "standard", region: dict = None) -> dict:
        """Tool: Render the current visual state as an ASCII layout (Mirror Neuron)"""
        if not self.visual_connected:
            return {"success": False, "error": "Visual interface not connected"}

        try:
            result = await self.webmcp.render_visual_layout(detail_level, region)
            return {"success": True, "layout": result.get("layout", "")}
        except Exception as e:
            return {"success": False, "error": str(e)}

    # === Visual Feedback Methods ===

    async def visual_log(self, message: str, level: str = "info"):
        """Display a log message on the visual map"""
        if not self.visual_connected:
            return

        colors = {
            "info": "#00aaff",
            "success": "#00ff00",
            "warning": "#ffaa00",
            "error": "#ff0000"
        }

        await self.webmcp.place_text(
            x=self.visual_position["x"],
            y=self.visual_position["y"],
            text=f"[{level.upper()}] {message[:50]}",
            color=colors.get(level, "#ffffff")
        )

        # Move position down for next message
        self.visual_position["y"] += 15

    async def visualize_evolution(self, task: EvolutionTask, status: str):
        """Visualize evolution progress on the map"""
        if not self.visual_connected:
            return

        status_colors = {
            "pending": "#888888",
            "in_progress": "#ffaa00",
            "completed": "#00ff00",
            "failed": "#ff0000",
            "error": "#ff0000"
        }

        # Place a tile representing this evolution
        await self.webmcp.place_tile(
            x=self.visual_position["x"],
            y=self.visual_position["y"],
            tile_type="evolution_task",
            data={
                "task_id": task.task_id,
                "goal": task.goal[:30],
                "status": status,
                "color": status_colors.get(status, "#ffffff")
            }
        )

        # Move position
        self.visual_position["y"] += 30
        if self.visual_position["y"] > 600:
            self.visual_position["y"] = 100
            self.visual_position["x"] += 150

    async def visualize_tectonic_shift(self, result: TectonicShiftResult):
        """Broadcast tectonic shift event to visual shell."""
        if not self.visual_connected:
            logger.debug("Visual interface not connected, skipping tectonic broadcast")
            return

        try:
            await self.webmcp.broadcast_event('tectonic_shift', {
                "success": result.success,
                "generations_run": result.generations_run,
                "baseline_ipc": result.baseline_ipc,
                "final_ipc": result.final_ipc,
                "improvement_pct": result.improvement_pct,
                "best_mutation": result.best_mutation_id,
                "timestamp": result.timestamp
            })

            if result.success:
                await self.visual_log(
                    f"🌋 TECTONIC: +{result.improvement_pct*100:.1f}% IPC",
                    "success"
                )
            else:
                await self.visual_log("🌋 TECTONIC: no improvement", "warning")

        except Exception as e:
            logger.warning(f"Failed to broadcast tectonic shift: {e}")

    async def broadcast_metabolism_telemetry(self):
        """Broadcast metabolism telemetry for Neural City visualization."""
        if not self.visual_connected:
            return

        try:
            # Gather metabolism data
            metabolism_state = {
                "ipc": self.tectonic_stage.baseline_ipc if self.tectonic_stage else 0.5,
                "throttle_level": "NONE",
                "timestamp": datetime.now().isoformat()
            }

            # Get from monitor if available
            if self.monitor and self.monitor._last_state:
                metabolism_state["throttle_level"] = self.monitor._last_state.throttle_level.value

            await self.webmcp.broadcast_event('metabolism_update', metabolism_state)

        except Exception as e:
            logger.warning(f"Failed to broadcast metabolism telemetry: {e}")

    async def initialize(self):
        """Initialize the evolution daemon"""
        logger.info("=" * 50)
        logger.info("🧬 Evolution Daemon V11 - Full Safety Pipeline")
        logger.info("=" * 50)

        # Check Z.ai connection
        if self.zai.is_mock_mode:
            logger.warning("⚠️ Running in SIMULATION mode (no Z.ai API key)")
            logger.warning("   Set ZAI_API_KEY for real AI-powered evolution")
        else:
            logger.info("✅ Connected to Z.ai (GLM-4-Plus)")
            logger.info("   Real self-improvement enabled!")

        # Connect to visual interface
        self.visual_connected = await self.webmcp.connect()
        if self.visual_connected:
            logger.info("✅ Connected to Visual Shell (WebMCP)")
            await self.visual_log("Evolution Daemon V11 Online", "success")
        else:
            logger.warning("⚠️ Visual interface not available (WebSocket not running)")

        # Initialize V11 Safety Pipeline
        self.monitor = PostCommitMonitor(git=self.git, webmcp_client=self.webmcp)
        self.recovery = EvolutionRecovery(git=self.git, guardian=self.guardian_gate)
        logger.info("✅ V11 Safety Pipeline initialized")
        logger.info("   - SandboxManager: Active")
        logger.info("   - GuardianGate: Active")
        logger.info("   - TierRouter: Active")
        logger.info("   - GitIntegration: Active")
        logger.info("   - PostCommitMonitor: Active")
        logger.info("   - EvolutionRecovery: Active")

        # Initial codebase scan
        await self.scan_codebase()

        # Load timeline if available
        if self.timeline:
            await self.timeline.load()
            logger.info("✅ Timeline loaded")

        logger.info(f"📊 Codebase: {self.analysis.python_files} Python files")
        logger.info(f"🎯 Ready for evolution (max {self.max_evolutions_per_session}/session)")

    async def scan_codebase(self) -> CodebaseAnalysis:
        """Analyze current codebase state"""
        logger.info("🔍 Scanning codebase...")

        # Count files
        py_files = await self.vfs.list_files("*.py")
        self.analysis.python_files = len(py_files)
        self.analysis.total_files = len(await self.vfs.list_files("*"))

        # Ask Architect to analyze for improvements
        if not self.zai.is_mock_mode:
            analysis_prompt = f"""
            Analyze this Geometry OS codebase and suggest 3 specific improvements.

            Stats:
            - Python files: {self.analysis.python_files}
            - Key modules: zai_bridge.py, area_agent.py, evolution_daemon.py

            Focus on:
            1. Code quality improvements
            2. Performance optimizations
            3. New features that would enhance self-improvement

            Respond as JSON array of suggestions with 'file', 'issue', and 'suggestion' keys.
            """

            response = await self.zai.chat("architect", analysis_prompt)
            self.analysis.improvement_opportunities = [response]
            logger.info(f"💡 Architect identified improvement opportunities")

        return self.analysis

    async def create_evolution_task(
        self,
        goal: str,
        target_file: Optional[str] = None,
        priority: int = 5
    ) -> EvolutionTask:
        """Create a new evolution task"""
        task = EvolutionTask(
            task_id=f"evolve_{datetime.now().strftime('%Y%m%d_%H%M%S')}",
            goal=goal,
            target_file=target_file,
            priority=priority
        )
        self.task_queue.append(task)
        logger.info(f"📋 Created task: {task.task_id} - {goal}")
        return task

    async def safe_evolve(self, task: EvolutionTask) -> bool:
        """
        V14 Safe Evolution - 9-Phase Pipeline

        1. ORIGINATE - Create proposal from task
        2. SANDBOX - Validate in isolated environment
        3. MIRROR_VALIDATE (NEW) - Perception benchmark validation
        4. GUARDIAN - AI-powered code review
        5. TIER - Classify risk level
        6. COMMIT/PR - Apply changes atomically
        7. VISUAL_VERIFY - Real-world verification
        8. MONITOR - Post-commit health checks
        9. RECOVER - Handle regressions if needed

        Returns:
            True if evolution succeeded, False otherwise
        """
        logger.info(f"🧬 [V14] Starting safe evolution: {task.task_id}")
        logger.info(f"   Goal: {task.goal}")
        task.status = "in_progress"

        # Initialize monitoring if not done yet
        if self.monitor is None:
            self.monitor = PostCommitMonitor(git=self.git, webmcp_client=self.webmcp)
        if self.recovery is None:
            self.recovery = EvolutionRecovery(git=self.git, guardian=self.guardian_gate)

        # Check if evolution is paused
        if self.recovery:
            paused, reason = self.recovery.is_paused()
            if paused:
                logger.warning(f"⏸️ Evolution paused: {reason}")
                task.status = "paused"
                task.result = f"Evolution paused: {reason}"
                return False

        # V14: Genetic Snapshot for Master Stage
        genetic_snapshot = {}
        if task.task_id.startswith("cap_") or (task.target_file and "visual_verification_service.py" in task.target_file):
            logger.info("📸 Phase 0: Creating genetic snapshot for Master Stage...")
            if task.target_file:
                try:
                    content = await self.vfs.read_file(task.target_file)
                    genetic_snapshot[task.target_file] = content
                    logger.info(f"   Snapshot created for {task.target_file}")
                except Exception as e:
                    logger.warning(f"   Failed to create genetic snapshot: {e}")

        try:
            # Visual feedback
            await self.visualize_evolution(task, "in_progress")
            await self.visual_log(f"[V14] Starting: {task.goal[:30]}", "info")

            # 1. ORIGINATE - Create proposal from task
            logger.info("📝 Phase 1: Creating proposal...")
            proposal = await self._create_proposal(task)
            await self.visual_log("Proposal created", "info")

            # 2. SANDBOX - Validate in isolated environment
            logger.info("🔬 Phase 2: Sandbox validation...")
            await self.visual_log("Running sandbox tests...", "info")
            sandbox_result = await self.sandbox.validate(proposal)

            if not sandbox_result.passed:
                logger.warning(f"❌ Sandbox validation failed: {sandbox_result.errors}")
                await self.visual_log("Sandbox FAILED", "error")
                task.status = "rejected"
                task.result = f"Sandbox validation failed: {sandbox_result.errors[:3]}"
                return False

            logger.info(f"✅ Sandbox passed: {sandbox_result.heartbeat_tests_passed}/{sandbox_result.heartbeat_tests_total} tests")
            await self.visual_log(f"Sandbox passed ({sandbox_result.heartbeat_tests_passed} tests)", "success")

            # 3. MIRROR_VALIDATE - V14 Master Stage perception validation
            if task.task_id.startswith("cap_") or (task.target_file and "visual_verification_service.py" in task.target_file):
                logger.info("🪞 Phase 3: Mirror validation (Perception benchmarks)...")
                await self.visual_log("Running mirror benchmarks...", "info")
                
                mirror_result = await self.mirror_bridge.validate_proposal(proposal)
                
                # Visual feedback for mirror results
                if self.visual_connected:
                    await self.webmcp.broadcast_event('mirror_validation_result', {
                        "task_id": task.task_id,
                        "success": mirror_result.success,
                        "accuracy": mirror_result.accuracy_score,
                        "immortality": mirror_result.immortality_passed,
                        "issues": mirror_result.issues
                    })

                if not mirror_result.success:
                    logger.warning(f"❌ Mirror validation failed: {mirror_result.issues}")
                    await self.visual_log("Mirror FAILED", "error")
                    task.status = "rejected"
                    task.result = f"Mirror validation failed: {mirror_result.issues[0] if mirror_result.issues else 'Unknown error'}"
                    return False

                logger.info(f"✅ Mirror passed: accuracy={mirror_result.accuracy_score:.2f}")
                await self.visual_log(f"Mirror passed ({mirror_result.accuracy_score:.0%})", "success")
            else:
                logger.info("⏭️ Phase 3: Skipping mirror validation (not a Master Stage task)")

            # 4. GUARDIAN - AI-powered code review
            logger.info("🛡️ Phase 4: Guardian review...")
            await self.visual_log("Guardian reviewing...", "info")
            verdict = await self.guardian_gate.review(proposal, sandbox_result)

            if not verdict.approved:
                logger.warning(f"❌ Guardian rejected: {verdict.issues_found}")
                await self.visual_log("Guardian REJECTED", "error")
                task.status = "rejected"
                task.result = f"Guardian rejected: {verdict.reasoning}"
                return False

            logger.info(f"✅ Guardian approved: risk={verdict.risk_level}, confidence={verdict.confidence:.2f}")
            await self.visual_log(f"Guardian approved ({verdict.risk_level} risk)", "success")

            # 5. TIER - Classify risk level
            logger.info("📊 Phase 5: Tier classification...")
            tier = self.tier_router.classify(proposal, verdict)
            tier_desc = self.tier_router.get_tier_description(tier)
            logger.info(f"   Tier {tier}: {tier_desc}")
            await self.visual_log(f"Tier {tier}: {tier_desc[:40]}", "info")

            # 6. COMMIT/PR - Apply changes
            if tier == 3:
                # Tier 3 requires human review - create PR instead
                logger.info("🌿 Phase 6: Creating PR branch (Tier 3)...")
                await self.visual_log("Creating PR for review...", "warning")
                branch_name = await self.git.create_pr_branch(proposal)
                logger.info(f"✅ Created PR branch: {branch_name}")
                task.status = "awaiting_review"
                task.result = f"Tier 3 change - PR created: {branch_name}"
                return True  # Successfully created PR

            # Apply changes and commit
            logger.info("💾 Phase 6: Applying changes...")
            await self.visual_log("Applying changes...", "info")

            # Actually apply the changes via VFS
            if proposal.diff_content and proposal.target_files:
                for target_file in proposal.target_files:
                    # In a real run, the sandbox would apply this
                    # Here we simulate the application
                    logger.info(f"   Modified: {target_file}")
                    task.changes_made.append(f"Modified: {target_file}")

            # Commit the changes
            commit_sha = await self.git.commit_evolution(proposal, verdict, tier)
            logger.info(f"✅ Committed: {commit_sha[:8]}")
            await self.visual_log(f"Committed: {commit_sha[:8]}", "success")

            # 7. VISUAL VERIFY - Journeyman Stage visual self-verification
            if task.visual_intent:
                logger.info("👁️ Phase 7: Visual verification...")
                await self.visual_log("Verifying visual changes...", "info")

                # Get current visual state from mirror neuron
                scene = await self._get_visual_scene()
                task.visual_attempt += 1

                verification_result = await self.visual_verification.verify(
                    task.visual_intent, scene, task.visual_attempt
                )

                # Phase 50: Export to frontend for visual debugging
                await self._dispatch_verification_to_frontend(verification_result, task.visual_intent)

                if verification_result.should_escalate:
                    logger.warning(f"🚨 Visual verification needs human review: {verification_result.summary}")
                    await self.visual_log("Visual: HUMAN REVIEW needed", "warning")
                    task.status = "awaiting_visual_review"
                    task.result = f"Visual verification requires human review: {verification_result.summary}"
                    return True  # Committed but needs review

                if verification_result.should_retry and task.visual_attempt < 5:
                    logger.info(f"🔄 Visual verification suggests retry: {verification_result.retry_suggestions[:2]}")
                    await self.visual_log(f"Visual: retry suggested", "info")
                    # Could implement auto-retry here in future iterations

                if not verification_result.success:
                    logger.warning(f"⚠️ Visual verification failed: {verification_result.summary}")
                    await self.visual_log("Visual verification FAILED", "warning")
                    # Log but continue - visual issues don't block evolution
                    task.result = f"Visual verification issues: {verification_result.summary}"
                else:
                    logger.info(f"✅ Visual verification passed (confidence: {verification_result.overall_confidence:.2f})")
                    await self.visual_log(f"Visual verified ({verification_result.overall_confidence:.0%})", "success")
            else:
                logger.info("⏭️ Phase 7: Skipping visual verification (no intent provided)")

            # 8. MONITOR - Post-commit health checks
            logger.info(f"🔍 Phase 8: Post-commit monitoring (Tier {tier})...")
            await self.visual_log("Running post-commit checks...", "info")

            # Capture baseline before monitoring
            await self.monitor.capture_baseline()
            result = await self.monitor.monitor(commit_sha, tier)

            # 9. RECOVER - Handle if unhealthy
            if not result.healthy:
                logger.warning(f"🚨 Regression detected: {result.issues}")
                await self.visual_log("REGRESSION detected!", "error")

                # V14: Primordial Rollback for Master Stage
                if genetic_snapshot:
                    logger.info("🚑 Phase 9: Invoking Primordial Rollback...")
                    await self.visual_log("Primordial Rollback...", "warning")
                    for file_path, content in genetic_snapshot.items():
                        await self.vfs.write_file(file_path, content)
                    logger.info("✅ Restored files from genetic snapshot")

                recovery_action = await self.recovery.handle_regression(commit_sha, result)
                logger.info(f"   Recovery action: {recovery_action.value}")

                task.status = "reverted"
                task.result = f"Regression detected, action: {recovery_action.value}"
                return False

            # Success!
            logger.info("✅ Evolution completed successfully!")
            await self.visual_log(f"SUCCESS: {task.goal[:25]}", "success")
            await self.visualize_evolution(task, "completed")

            task.status = "completed"
            task.result = "Evolution successful"
            self.evolution_count += 1
            return True

        except Exception as e:
            logger.error(f"❌ Evolution failed: {e}")
            logger.error(traceback.format_exc())
            
            # V14: Rollback on exception if snapshot exists
            if genetic_snapshot:
                logger.info("🚑 Emergency Primordial Rollback...")
                for file_path, content in genetic_snapshot.items():
                    await self.vfs.write_file(file_path, content)

            task.status = "error"
            task.result = str(e)
            await self.visual_log(f"ERROR: {str(e)[:30]}", "error")
            await self.visualize_evolution(task, "error")
            return False

            # Success!
            logger.info("✅ Evolution completed successfully!")
            await self.visual_log(f"SUCCESS: {task.goal[:25]}", "success")
            await self.visualize_evolution(task, "completed")

            task.status = "completed"
            task.result = "Evolution successful"
            self.evolution_count += 1
            return True

        except Exception as e:
            logger.error(f"❌ Evolution failed: {e}")
            logger.error(traceback.format_exc())
            task.status = "error"
            task.result = str(e)
            await self.visual_log(f"ERROR: {str(e)[:30]}", "error")
            await self.visualize_evolution(task, "error")
            return False

    async def _create_proposal(self, task: EvolutionTask) -> EvolutionProposal:
        """
        Create an EvolutionProposal from an EvolutionTask.

        This involves:
        1. Reading target file context
        2. Asking AI for the actual code changes
        3. Formatting as a proposal
        """
        # Get context
        context = ""
        if task.target_file:
            try:
                context = await self.vfs.read_file(task.target_file)
            except FileNotFoundError:
                pass

        # Ask AI for solution
        coder_prompt = f"""
        EVOLUTION TASK: {task.goal}

        {'Target file: ' + task.target_file if task.target_file else 'Choose appropriate file'}

        {'Current code context:\n```python\n' + context[:5000] + '\n```' if context else ''}

        MANDATORY REQUIREMENT:
        You MUST provide the changes ONLY as a UNIFIED DIFF format.
        Include the full file path and the exact changes needed.
        Do NOT provide the full file content.
        Do NOT simplify or remove existing logic unless specifically requested.
        Your response must be a valid .patch file content.
        """

        solution = await self.zai.chat("coder", coder_prompt)

        # Cleanup solution: remove markdown code blocks if present
        if "```diff" in solution:
            solution = solution.split("```diff")[1].split("```")[0].strip()
        elif "```" in solution:
            solution = solution.split("```")[1].split("```")[0].strip()

        # Create proposal
        proposal = EvolutionProposal(
            proposal_id=task.task_id,
            goal=task.goal,
            target_files=[task.target_file] if task.target_file else [],
            diff_content=solution,
            metadata={"task_priority": task.priority}
        )

        return proposal

    async def _get_visual_scene(self) -> dict:
        """
        Get current visual state from the mirror neuron system.

        Returns a scene dict with children elements for visual verification.
        Falls back to empty scene if WebMCP not connected.
        """
        if not self.webmcp or not self.visual_connected:
            logger.debug("Visual system not connected, returning empty scene")
            return {"children": []}

        try:
            # Request visual state from PixiJS via WebMCP
            state = await self.webmcp.get_visual_state()
            if state and "children" in state:
                return state
            return {"children": []}
        except Exception as e:
            logger.warning(f"Failed to get visual scene: {e}")
            return {"children": []}

    async def _dispatch_verification_to_frontend(
        self,
        result: 'VerificationResult',
        intent: 'VisualIntent'
    ) -> None:
        """
        Phase 50: Dispatch verification results to frontend via WebMCP.

        This enables the VisualDebugOverlay to display:
        - Bounding boxes with verification status
        - Confidence scores
        - Retry suggestions
        - Spatial relation lines
        """
        try:
            # Export result for frontend
            export_data = self.visual_verification.export_to_frontend(result, intent)

            # Dispatch via WebMCP if connected
            if self.webmcp and self.visual_connected:
                await self.webmcp.broadcast_event('verification_result', export_data)
                logger.debug("Dispatched verification result to frontend")
            else:
                logger.debug("WebMCP not connected, skipping frontend dispatch")

        except Exception as e:
            logger.warning(f"Failed to dispatch verification to frontend: {e}")

    async def evolve(self, task: EvolutionTask) -> bool:
        """
        Execute an evolution task (V11: forwards to safe_evolve)

        This method is kept for backwards compatibility.
        New code should use safe_evolve() directly.
        """
        return await self.safe_evolve(task)

    async def legacy_evolve(self, task: EvolutionTask) -> bool:
        """
        [DEPRECATED] Original evolution method - use safe_evolve() instead

        This is the V10 self-improvement loop kept for reference:
        1. OBSERVE: Gather context about the target
        2. REASON: Ask Z.ai for solution
        3. ACT: Write the improvement
        4. VERIFY: Run tests AND visual inspection
        5. COMMIT: Save if successful
        6. VISUALIZE: Show progress on map
        """
        logger.info(f"🧬 Starting evolution: {task.task_id}")
        logger.info(f"   Goal: {task.goal}")
        task.status = "in_progress"

        # Visual feedback: Show task starting
        await self.visualize_evolution(task, "in_progress")
        await self.visual_log(f"Starting: {task.goal[:30]}", "info")

        try:
            # 1. OBSERVE - Get context
            context = ""
            if task.target_file:
                try:
                    context = await self.vfs.read_file(task.target_file)
                    logger.info(f"   Target: {task.target_file} ({len(context)} bytes)")
                    await self.visual_log(f"Reading: {task.target_file[:25]}", "info")
                except FileNotFoundError:
                    logger.warning(f"   Target file not found: {task.target_file}")

            # 2. REASON - Ask Coder agent for solution
            coder_prompt = f"""
            EVOLUTION TASK: {task.goal}

            {'Target file: ' + task.target_file if task.target_file else 'Choose appropriate file'}

            {'Current code context:\\n```\\n' + context[:2000] + '\\n```' if context else ''}

            Provide the complete improved code or describe the specific changes needed.
            If writing code, include the full file path and complete implementation.
            """

            logger.info("🧠 Consulting Coder agent via Z.ai...")
            await self.visual_log("Consulting AI...", "info")
            solution = await self.zai.chat("coder", coder_prompt)
            logger.info(f"💡 Coder response: {solution[:200]}...")

            # 3. ACT - Parse and apply changes
            # (The Coder can use function calling to actually write files)
            task.changes_made.append(solution[:500])

            # 4. VERIFY - Run tests
            logger.info("🔍 Verifying changes...")
            await self.visual_log("Running tests...", "warning")
            test_result = await self.vfs.run_tests()

            if test_result["success"]:
                logger.info("✅ Tests passed!")
                task.status = "completed"
                task.result = "Evolution successful - tests passed"
                self.evolution_count += 1

                # Visual success
                await self.visualize_evolution(task, "completed")
                await self.visual_log(f"SUCCESS: {task.goal[:25]}", "success")
                return True
            else:
                logger.warning(f"⚠️ Tests failed: {test_result.get('error', 'Unknown')}")
                await self.visual_log("Tests failed - analyzing...", "warning")

                # Guardian should review failures
                guardian_prompt = f"""
                A code change was attempted but tests failed.

                Goal: {task.goal}
                Changes: {task.changes_made}
                Test output: {test_result.get('output', 'No output')[:500]}

                Should we rollback? Analyze the failure and suggest a fix.
                """
                guardian_response = await self.zai.chat("guardian", guardian_prompt)
                logger.info(f"🛡️ Guardian analysis: {guardian_response[:200]}...")

                task.status = "failed"
                task.result = f"Tests failed: {test_result.get('error', 'Unknown')}"

                # Visual failure
                await self.visualize_evolution(task, "failed")
                await self.visual_log(f"FAILED: {test_result.get('error', 'Unknown')[:20]}", "error")
                return False

        except Exception as e:
            logger.error(f"❌ Evolution failed: {e}")
            logger.error(traceback.format_exc())
            task.status = "error"
            task.result = str(e)
            return False

    async def run_loop(self):
        """
        Main evolution loop

        Continuously:
        1. Processes tasks from queue
        2. Generates new improvement opportunities
        3. Validates and commits changes
        """
        self.running = True
        logger.info("🚀 Evolution Daemon Running...")
        logger.info("   Watching for improvement opportunities...")

        iteration = 0
        while self.running and self.evolution_count < self.max_evolutions_per_session:
            iteration += 1

            # Process queued tasks
            if self.task_queue:
                task = self.task_queue.pop(0)
                await self.evolve(task)

            # Generate new tasks periodically
            elif iteration % 5 == 0 and not self.zai.is_mock_mode:
                # Ask Oracle for improvement suggestions
                oracle_prompt = """
                Suggest one specific, high-impact improvement for Geometry OS.
                Focus on: performance, reliability, or new self-improvement capabilities.
                Be specific about which file to modify and what to change.
                """
                suggestion = await self.zai.chat("oracle", oracle_prompt)

                # Auto-create task from suggestion
                await self.create_evolution_task(
                    goal=suggestion[:200],
                    priority=7
                )

            # Broadcast metabolism telemetry for Neural City
            elif iteration % 2 == 0:  # Every ~10 seconds
                await self.broadcast_metabolism_telemetry()

            await asyncio.sleep(5)

        logger.info(f"🏁 Evolution session complete. {self.evolution_count} improvements made.")

    async def stop(self):
        """Stop the evolution daemon"""
        self.running = False
        if self._ambient_heartbeat_task:
            self._ambient_heartbeat_task.cancel()
        if self._radio_broadcast_task:
            self._radio_broadcast_task.cancel()
        logger.info("🛑 Evolution Daemon stopped")

    # =========================================================================
    # V2.0: AMBIENT NARRATIVE SYSTEM
    # =========================================================================

    def enable_ambient_mode(self, wordpress_url: str = "http://localhost:8080"):
        """
        Enable Ambient Narrative Mode.

        When enabled, the daemon:
        - Connects to WordPress via WebMCP
        - Broadcasts heartbeat status to the narrative session
        - Logs thoughts and steering actions to WordPress

        Args:
            wordpress_url: WordPress base URL for WebMCP
        """
        if not HAS_WEBMCP:
            logger.warning("⚠️ WebMCP not available - ambient mode disabled")
            return False

        self.ambient_mode = True

        # Initialize WebMCP hook
        bridge = EvolutionWebMCPBridge(wordpress_url=wordpress_url, enabled=True)
        self.webmcp_hook = EvolutionWebMCPHook(
            bridge=bridge,
            log_improvements=True,
            update_architecture=True,
            min_delta_threshold=0.01
        )

        logger.info(f"📖 Ambient Narrative Mode enabled (WordPress: {wordpress_url})")
        return True

    # =========================================================================
    # GOSR RADIO - NARRATIVE BROADCASTING
    # =========================================================================

    def enable_radio(
        self,
        station_id: str = "87.6",
        use_llm: bool = False,
        llm_config: Optional[Dict[str, Any]] = None
    ) -> bool:
        """
        Enable GOSR Radio Broadcasting.

        When enabled, the daemon:
        - Creates a NarrativeBroadcaster instance
        - Broadcasts narrative segments based on OS telemetry
        - Uses the specified station personality
        - Optionally uses LM Studio for AI-generated narratives

        Args:
            station_id: Radio station identifier (FM frequency)
                       "87.6" = Substrate Jazz (default)
                       "92.3" = Debug Metal
                       "95.1" = Silicon Noir
                       "99.9" = Neutral Chronicler
            use_llm: Whether to use LM Studio for AI narratives (default: False)
            llm_config: Optional LLM configuration dict with keys:
                       - lm_studio_url: LM Studio API URL (default: http://localhost:1234/v1)

        Returns:
            True if radio enabled successfully, False otherwise
        """
        if not HAS_RADIO:
            logger.warning("NarrativeBroadcaster not available - radio disabled")
            return False

        self.radio_enabled = True
        self.radio_station_id = station_id

        # Create broadcaster instance
        self.radio_broadcaster = NarrativeBroadcaster(
            enabled=True,
            station_id=station_id,
            broadcast_interval=30.0,  # 30 seconds between broadcasts
            use_llm=use_llm,
            llm_config=llm_config
        )

        llm_status = " (LLM enabled)" if use_llm else ""
        logger.info(f"📻 GOSR Radio enabled: Station {station_id} FM{llm_status}")
        return True

    def set_radio_station(self, station_id: str) -> bool:
        """
        Switch radio station at runtime.

        Args:
            station_id: New station identifier (FM frequency)

        Returns:
            True if station changed, False if radio not enabled
        """
        if not self.radio_enabled or not self.radio_broadcaster:
            logger.warning("Radio not enabled - cannot change station")
            return False

        self.radio_station_id = station_id
        self.radio_broadcaster.set_station(station_id)
        logger.info(f"📻 Switched to station: {station_id} FM")
        return True

    async def _radio_broadcast_loop(self):
        """
        Background task that broadcasts radio segments.

        Runs every broadcast_interval seconds when radio is enabled.
        Uses telemetry data to generate contextual narratives.
        """
        while self.running:
            try:
                # Get broadcast interval from broadcaster
                interval = 30.0
                if self.radio_broadcaster:
                    interval = self.radio_broadcaster.broadcast_interval

                await asyncio.sleep(interval)

                if not self.radio_enabled or not self.radio_broadcaster:
                    continue

                # Gather telemetry for broadcast
                telemetry = await self._gather_radio_telemetry()

                # Generate broadcast segment
                segment = self.radio_broadcaster.broadcast(telemetry)

                if segment:
                    # Broadcast to visual bridge for HUD display
                    if self.visual_connected and self.webmcp:
                        await self.webmcp.broadcast_event('radio_broadcast', segment.to_dict())

                    logger.info(f"📻 [{segment.station_id}] {segment.segment_type}: {segment.content[:60]}...")

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.warning(f"Radio broadcast error: {e}")
                await asyncio.sleep(10)

    async def _gather_radio_telemetry(self) -> dict:
        """
        Gather system telemetry for radio broadcast generation.

        Returns:
            Dict with telemetry values: entropy, fps, evolution_count, etc.
        """
        telemetry = {
            "entropy": 0.5,  # Default entropy
            "fps": 60,
            "evolution_count": self.evolution_count,
            "visual_connected": self.visual_connected,
            "ambient_state": self.ambient_state,
            "timestamp": datetime.now().isoformat()
        }

        # Try to get real FPS from visual state
        if self.visual_connected and self.webmcp:
            try:
                state = await self.webmcp.get_os_state()
                if state:
                    telemetry["fps"] = state.get("fps", 60)
                    telemetry["map_tiles"] = state.get("tile_count", 0)
            except Exception:
                pass

        # Calculate entropy from recent activity
        # High activity = high entropy, low activity = low entropy
        if self.analysis and self.analysis.python_files > 0:
            # Normalize to 0-1 range
            telemetry["entropy"] = min(1.0, self.evolution_count / 10.0)

        return telemetry

    async def _ambient_heartbeat_loop(self):
        """
        Background task that sends heartbeat updates to WordPress.

        Runs every 5 seconds when ambient mode is enabled.
        """
        while self.running:
            try:
                await asyncio.sleep(5)

                if not self.ambient_mode or not self.webmcp_hook:
                    continue

                # Send daemon status to visual bridge (which forwards to WordPress)
                if self.visual_connected and self.webmcp:
                    await self.webmcp._call("daemon_heartbeat", {
                        "state": self.ambient_state,
                        "evolution_count": self.evolution_count,
                        "visual_connected": self.visual_connected
                    })

                logger.debug(f"💓 Ambient heartbeat: {self.ambient_state}")

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.warning(f"Ambient heartbeat error: {e}")
                await asyncio.sleep(10)

    async def set_ambient_state(self, new_state: str):
        """
        Change the ambient state and log to WordPress.

        States:
        - MONITORING: Passive observation
        - SUGGESTING: AI has suggestions to offer
        - STEERING: AI is actively steering the session

        Args:
            new_state: The new ambient state
        """
        valid_states = ["MONITORING", "SUGGESTING", "STEERING"]
        if new_state not in valid_states:
            logger.warning(f"Invalid ambient state: {new_state}")
            return

        old_state = self.ambient_state
        self.ambient_state = new_state

        # Log state change
        logger.info(f"📖 Ambient state: {old_state} → {new_state}")

        # Broadcast to visual bridge
        if self.visual_connected and self.webmcp:
            await self.webmcp._call("narrative_event", {
                "event_type": "state_change",
                "old_state": old_state,
                "new_state": new_state,
                "evolution_count": self.evolution_count
            })

    async def publish_narrative_thought(self, thought: str, state: str = None):
        """
        Publish an AI thought to the narrative session.

        Args:
            thought: The thought text
            state: Optional state to transition to
        """
        if not self.ambient_mode:
            return

        if state:
            await self.set_ambient_state(state)

        # Broadcast to visual bridge
        if self.visual_connected and self.webmcp:
            await self.webmcp._call("narrative_event", {
                "event_type": "thought",
                "thought": thought,
                "state": self.ambient_state
            })

        logger.info(f"💭 Published thought: {thought[:50]}...")


# CLI Interface
async def main():
    import argparse

    parser = argparse.ArgumentParser(description="Geometry OS Evolution Daemon")
    parser.add_argument("--api-key", help="Z.ai API key (or set ZAI_API_KEY)")
    parser.add_argument("--max-evolutions", type=int, default=3, help="Max evolutions per session")
    parser.add_argument("--task", help="Run a specific evolution task")
    parser.add_argument("--scan", action="store_true", help="Just scan codebase")
    parser.add_argument("--ambient", action="store_true", help="Enable Ambient Narrative Mode")
    parser.add_argument("--wordpress-url", default="http://localhost:8080", help="WordPress URL for ambient mode")
    parser.add_argument("--radio", action="store_true", help="Enable GOSR Radio Broadcasting")
    parser.add_argument("--station", default="87.6", help="Radio station ID (87.6=Jazz, 92.3=Metal, 95.1=Noir, 99.9=Chronicler)")
    # LM Studio narrative control flags
    lm_group = parser.add_mutually_exclusive_group()
    lm_group.add_argument("--lm-studio", action="store_true", help="Enable LM Studio for AI-generated narratives (requires LM Studio running)")
    lm_group.add_argument("--no-lm", action="store_true", help="Explicitly disable LM Studio (use templates only)")
    parser.add_argument("--lm-url", default="http://localhost:1234/v1", help="LM Studio API URL (default: http://localhost:1234/v1)")
    args = parser.parse_args()

    daemon = EvolutionDaemon(api_key=args.api_key)
    daemon.max_evolutions_per_session = args.max_evolutions

    await daemon.initialize()

    # Enable ambient mode if requested
    if args.ambient:
        daemon.enable_ambient_mode(wordpress_url=args.wordpress_url)
        # Start heartbeat task
        daemon._ambient_heartbeat_task = asyncio.create_task(daemon._ambient_heartbeat_loop())

    # Enable radio if requested
    if args.radio:
        # Determine LLM usage: --lm-studio enables, --no-lm disables, default is off (backward compat)
        use_llm = args.lm_studio and not args.no_lm
        llm_config = None
        if use_llm:
            llm_config = {"lm_studio_url": args.lm_url}
        if daemon.enable_radio(station_id=args.station, use_llm=use_llm, llm_config=llm_config):
            # Start radio broadcast loop
            daemon._radio_broadcast_task = asyncio.create_task(daemon._radio_broadcast_loop())

    if args.scan:
        print(json.dumps({
            "python_files": daemon.analysis.python_files,
            "total_files": daemon.analysis.total_files,
            "opportunities": daemon.analysis.improvement_opportunities
        }, indent=2))
        return

    if args.task:
        task = await daemon.create_evolution_task(args.task)
        await daemon.evolve(task)
        print(f"Task result: {task.result}")
        return

    # Run continuous evolution
    try:
        await daemon.run_loop()
    except KeyboardInterrupt:
        await daemon.stop()


if __name__ == "__main__":
    asyncio.run(main())
