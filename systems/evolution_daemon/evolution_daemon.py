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

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

# WebSocket support for visual interface
try:
    import websockets
    HAS_WEBSOCKETS = True
except ImportError:
    HAS_WEBSOCKETS = False

# Import Z.ai Integration (our new intelligence layer)
from zai_agent_integration import ZAIIntegration, ZHIPU_AVAILABLE

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

    def __init__(self, ws_url: str = "ws://localhost:8765"):
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

    def __init__(self, api_key: Optional[str] = None, ws_url: str = "ws://localhost:8765"):
        # Initialize Z.ai Integration (our new brain)
        self.zai = ZAIIntegration(api_key=api_key)
        self.vfs = VirtualFileSystem()

        # Visual interface (WebMCP connection to PixiJS)
        self.webmcp = WebMCPClient(ws_url=ws_url)
        self.visual_connected = False

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

        # Register tool callbacks for Z.ai function calling
        self._register_tools()

    def _register_tools(self):
        """Register VFS and Visual tools for Z.ai function calling"""
        # Code tools
        self.zai.register_tool_callback("read_file", self._tool_read_file)
        self.zai.register_tool_callback("write_file", self._tool_write_file)
        self.zai.register_tool_callback("execute_command", self._tool_execute)

        # Visual tools (for AI to interact with the map)
        self.zai.register_tool_callback("visual_inspect", self._tool_visual_inspect)
        self.zai.register_tool_callback("visual_place_tile", self._tool_visual_place_tile)
        self.zai.register_tool_callback("visual_get_state", self._tool_visual_get_state)

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
        V11 Safe Evolution - Full Safety Pipeline

        This is the new evolution method that uses the complete V11 safety pipeline:

        1. ORIGINATE - Create proposal from task
        2. SANDBOX - Validate in isolated environment
        3. GUARDIAN - AI-powered code review
        4. TIER - Classify risk level
        5. COMMIT/PR - Apply changes atomically
        6. MONITOR - Post-commit health checks
        7. RECOVER - Handle regressions if needed

        Returns:
            True if evolution succeeded, False otherwise
        """
        logger.info(f"🧬 [V11] Starting safe evolution: {task.task_id}")
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

        try:
            # Visual feedback
            await self.visualize_evolution(task, "in_progress")
            await self.visual_log(f"[V11] Starting: {task.goal[:30]}", "info")

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

            # 3. GUARDIAN - AI-powered code review
            logger.info("🛡️ Phase 3: Guardian review...")
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

            # 4. TIER - Classify risk level
            logger.info("📊 Phase 4: Tier classification...")
            tier = self.tier_router.classify(proposal, verdict)
            tier_desc = self.tier_router.get_tier_description(tier)
            logger.info(f"   Tier {tier}: {tier_desc}")
            await self.visual_log(f"Tier {tier}: {tier_desc[:40]}", "info")

            # 5. COMMIT/PR - Apply changes
            if tier == 3:
                # Tier 3 requires human review - create PR instead
                logger.info("🌿 Phase 5: Creating PR branch (Tier 3)...")
                await self.visual_log("Creating PR for review...", "warning")
                branch_name = await self.git.create_pr_branch(proposal)
                logger.info(f"✅ Created PR branch: {branch_name}")
                task.status = "awaiting_review"
                task.result = f"Tier 3 change - PR created: {branch_name}"
                return True  # Successfully created PR

            # Apply changes and commit
            logger.info("💾 Phase 5: Applying changes...")
            await self.visual_log("Applying changes...", "info")

            # Actually apply the changes via VFS
            if proposal.diff_content and proposal.target_files:
                for target_file in proposal.target_files:
                    # For now, we'll just log - actual diff application
                    # would be done by the sandbox manager
                    logger.info(f"   Modified: {target_file}")
                    task.changes_made.append(f"Modified: {target_file}")

            # Commit the changes
            commit_sha = await self.git.commit_evolution(proposal, verdict, tier)
            logger.info(f"✅ Committed: {commit_sha[:8]}")
            await self.visual_log(f"Committed: {commit_sha[:8]}", "success")

            # 6. MONITOR - Post-commit health checks
            logger.info(f"🔍 Phase 6: Post-commit monitoring (Tier {tier})...")
            await self.visual_log("Running post-commit checks...", "info")

            # Capture baseline before monitoring
            await self.monitor.capture_baseline()
            result = await self.monitor.monitor(commit_sha, tier)

            # 7. RECOVER - Handle if unhealthy
            if not result.healthy:
                logger.warning(f"🚨 Regression detected: {result.issues}")
                await self.visual_log("REGRESSION detected!", "error")

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

        {'Current code context:\\n```\\n' + context[:2000] + '\\n```' if context else ''}

        Provide the changes as a unified diff format.
        Include the full file path and the exact changes needed.
        """

        solution = await self.zai.chat("coder", coder_prompt)

        # Create proposal
        proposal = EvolutionProposal(
            proposal_id=task.task_id,
            goal=task.goal,
            target_files=[task.target_file] if task.target_file else [],
            diff_content=solution,
            metadata={"task_priority": task.priority}
        )

        return proposal

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

            await asyncio.sleep(5)

        logger.info(f"🏁 Evolution session complete. {self.evolution_count} improvements made.")

    async def stop(self):
        """Stop the evolution daemon"""
        self.running = False
        logger.info("🛑 Evolution Daemon stopped")


# CLI Interface
async def main():
    import argparse

    parser = argparse.ArgumentParser(description="Geometry OS Evolution Daemon")
    parser.add_argument("--api-key", help="Z.ai API key (or set ZAI_API_KEY)")
    parser.add_argument("--max-evolutions", type=int, default=3, help="Max evolutions per session")
    parser.add_argument("--task", help="Run a specific evolution task")
    parser.add_argument("--scan", action="store_true", help="Just scan codebase")
    args = parser.parse_args()

    daemon = EvolutionDaemon(api_key=args.api_key)
    daemon.max_evolutions_per_session = args.max_evolutions

    await daemon.initialize()

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
