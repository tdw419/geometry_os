#!/usr/bin/env python3
"""
Synaptic Bridge - WebSocket server for Legible Brain execution.

Connects the visual morphological substrate to the GlyphStratum executor.
When you click on the brain map, this bridge receives the DAG and executes it.

Phase 41: Ouroboros Repair - The brain can now write to its own substrate.

Usage:
    python3 systems/pixel_brain/synaptic_bridge.py

Protocol:
    Client -> Server: {"type": "SYNAPTIC_PROBE", "dag": {...}, "coords": {"x": 100, "y": 200}}
    Server -> Client: {"type": "EXECUTION_RESULT", "result": ..., "status": ..., "memory": {...}}

    Phase 41 additions:
    Client -> Server: {"type": "SUBSTRATE_WRITE", "coords": {...}, "mutation": {...}}
    Server -> Client: {"type": "WRITE_RESULT", "success": true, "atlas_path": "..."}
    Client -> Server: {"type": "FAULT_SCAN", "threshold": 0.6}
    Server -> Client: {"type": "FAULT_REPORT", "fractures": [...]}
"""

import asyncio
import json
import logging
from typing import Any, Dict, Optional, List, Tuple
from pathlib import Path
import sys
import struct
import time
from dataclasses import dataclass

# Add project root and GlyphStratum core to path
root_path = Path(__file__).parent.parent.parent
sys.path.insert(0, str(root_path))

# Handle the hyphenated 'agent-harness' directory
glyph_stratum_path = root_path / "systems" / "glyph_stratum" / "agent-harness" / "cli_anything"
if glyph_stratum_path.exists():
    sys.path.insert(0, str(glyph_stratum_path))

try:
    import websockets
    from websockets.server import serve
    HAS_WEBSOCKETS = True
except ImportError:
    HAS_WEBSOCKETS = False
    print("Installing websockets...")
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "websockets"])
    import websockets
    from websockets.server import serve

# Optional glyph_stratum imports - may not be available
try:
    from glyph_stratum.core.stratum import (
        Stratum, Opcode, GlyphInfo, GlyphMetadata, ProvenanceInfo
    )
    from glyph_stratum.core.glyph_registry import GlyphRegistry
    from glyph_stratum.core.executor import GlyphStratumExecutor
    HAS_GLYPH_STRATUM = True
except ImportError:
    HAS_GLYPH_STRATUM = False
    Stratum = None
    GlyphRegistry = None
    GlyphStratumExecutor = None
    logging.warning("glyph_stratum not available - running in degraded mode")

# Lazy import to avoid circular dependency
SyntacticDistrict = None

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("SynapticBridge")


# =============================================================================
# Phase 41: Ouroboros Repair Engine
# =============================================================================

@dataclass
class Fracture:
    """A detected fault in the morphological substrate."""
    x: int
    y: int
    entropy: float
    activation: float
    sector: int
    severity: str  # "low", "medium", "critical"


@dataclass
class Mutation:
    """A repair mutation to apply to the substrate."""
    x: int
    y: int
    radius: int
    delta_r: float  # Activation delta
    delta_g: float  # Entropy delta (usually negative for repair)
    target_entropy: float
    rationale: str


class OuroborosRepairEngine:
    """
    The self-healing engine for the Legible Brain.

    Detects fractures (high-entropy regions) and prescribes mutations
    to repair the morphological substrate.
    """

    def __init__(self, atlas_path: Optional[str] = None):
        self.atlas_path = Path(atlas_path) if atlas_path else None
        self.atlas_data: Optional[bytearray] = None
        self.atlas_width = 1024
        self.atlas_height = 1024
        self.repair_history: List[Dict] = []
        self.stats = {
            "fractures_detected": 0,
            "mutations_applied": 0,
            "successful_repairs": 0
        }

    def load_atlas(self, path: Optional[str] = None) -> bool:
        """Load the brain atlas for mutation."""
        if path:
            self.atlas_path = Path(path)

        if not self.atlas_path or not self.atlas_path.exists():
            logger.warning(f"Atlas not found: {self.atlas_path}")
            return False

        try:
            # Try to load as raw RGBA
            with open(self.atlas_path, "rb") as f:
                raw_data = f.read()

            expected_size = self.atlas_width * self.atlas_height * 4
            if len(raw_data) == expected_size:
                self.atlas_data = bytearray(raw_data)
                logger.info(f"Loaded atlas: {self.atlas_path} ({len(raw_data)} bytes)")
                return True
            else:
                logger.warning(f"Atlas size mismatch: {len(raw_data)} != {expected_size}")
                return False

        except Exception as e:
            logger.error(f"Failed to load atlas: {e}")
            return False

    def save_atlas(self) -> bool:
        """Save the mutated atlas back to disk."""
        if not self.atlas_data or not self.atlas_path:
            return False

        try:
            with open(self.atlas_path, "wb") as f:
                f.write(self.atlas_data)
            logger.info(f"Saved mutated atlas: {self.atlas_path}")
            return True
        except Exception as e:
            logger.error(f"Failed to save atlas: {e}")
            return False

    def sample_pixel(self, x: int, y: int) -> Tuple[float, float, float]:
        """Sample RGBA values at a pixel. Returns (r, g, b) normalized 0-1."""
        if not self.atlas_data:
            return (0.5, 0.2, 0.5)

        x = max(0, min(x, self.atlas_width - 1))
        y = max(0, min(y, self.atlas_height - 1))

        idx = (y * self.atlas_width + x) * 4
        r = self.atlas_data[idx] / 255.0
        g = self.atlas_data[idx + 1] / 255.0
        b = self.atlas_data[idx + 2] / 255.0

        return (r, g, b)

    def write_pixel(self, x: int, y: int, r: float, g: float, b: float):
        """Write RGBA values to a pixel."""
        if not self.atlas_data:
            return

        x = max(0, min(x, self.atlas_width - 1))
        y = max(0, min(y, self.atlas_height - 1))

        idx = (y * self.atlas_width + x) * 4
        self.atlas_data[idx] = int(r * 255)
        self.atlas_data[idx + 1] = int(g * 255)
        self.atlas_data[idx + 2] = int(b * 255)
        # Alpha stays 255

    def scan_for_fractures(self, threshold: float = 0.6) -> List[Fracture]:
        """
        Scan the atlas for high-entropy regions (fractures).

        These are areas where the neural computation is uncertain,
        indicated by high G channel (entropy) values.
        """
        fractures = []

        if not self.atlas_data:
            # Generate synthetic fractures for demo
            import random
            for _ in range(10):
                x = random.randint(100, self.atlas_width - 100)
                y = random.randint(100, self.atlas_height - 100)
                entropy = random.uniform(threshold, 1.0)
                activation = random.uniform(0.3, 0.8)
                sector = int(x / self.atlas_width * 5)

                severity = "critical" if entropy > 0.8 else "medium" if entropy > 0.7 else "low"
                fractures.append(Fracture(x, y, entropy, activation, sector, severity))

            logger.info(f"Generated {len(fractures)} synthetic fractures")
            return fractures

        # Scan actual atlas
        sample_step = 16  # Sample every 16 pixels for performance
        for y in range(0, self.atlas_height, sample_step):
            for x in range(0, self.atlas_width, sample_step):
                r, g, b = self.sample_pixel(x, y)

                if g > threshold:  # High entropy
                    sector = int(b * 5)
                    severity = "critical" if g > 0.8 else "medium" if g > 0.7 else "low"
                    fractures.append(Fracture(x, y, g, r, sector, severity))

        self.stats["fractures_detected"] += len(fractures)
        logger.info(f"Detected {len(fractures)} fractures (threshold={threshold})")
        return fractures

    def prescribe_mutation(self, fracture: Fracture) -> Mutation:
        """
        Generate a repair mutation for a fracture.

        The goal is to reduce entropy (G channel) while preserving
        or enhancing the activation pattern (R channel).
        """
        # Calculate target entropy - reduce it
        target_entropy = fracture.entropy * 0.5  # Cut entropy in half

        # Calculate deltas
        delta_g = target_entropy - fracture.entropy  # Negative (reduces entropy)

        # Slightly boost activation if it's low
        delta_r = 0.1 if fracture.activation < 0.5 else 0.0

        # Radius based on severity
        radius = 8 if fracture.severity == "critical" else 4

        rationale = f"Heal fracture at ({fracture.x}, {fracture.y}): entropy {fracture.entropy:.2f} → {target_entropy:.2f}"

        return Mutation(
            x=fracture.x,
            y=fracture.y,
            radius=radius,
            delta_r=delta_r,
            delta_g=delta_g,
            target_entropy=target_entropy,
            rationale=rationale
        )

    def apply_mutation(self, mutation: Mutation) -> Dict[str, Any]:
        """
        Apply a mutation to the substrate.

        This modifies the actual pixel data in the atlas.
        """
        if not self.atlas_data and not self.load_atlas():
            return {
                "success": False,
                "error": "No atlas loaded"
            }

        start_time = time.time()
        pixels_modified = 0

        # Apply within radius using gaussian falloff
        for dy in range(-mutation.radius, mutation.radius + 1):
            for dx in range(-mutation.radius, mutation.radius + 1):
                dist = (dx * dx + dy * dy) ** 0.5
                if dist > mutation.radius:
                    continue

                # Gaussian falloff
                falloff = 1.0 - (dist / mutation.radius) ** 2

                x = mutation.x + dx
                y = mutation.y + dy

                r, g, b = self.sample_pixel(x, y)

                # Apply deltas with falloff
                new_r = max(0, min(1, r + mutation.delta_r * falloff))
                new_g = max(0, min(1, g + mutation.delta_g * falloff))

                self.write_pixel(x, y, new_r, new_g, b)
                pixels_modified += 1

        # Save the mutation
        self.save_atlas()

        elapsed = (time.time() - start_time) * 1000

        # Record in history
        record = {
            "timestamp": time.time(),
            "mutation": {
                "x": mutation.x,
                "y": mutation.y,
                "radius": mutation.radius,
                "target_entropy": mutation.target_entropy,
                "rationale": mutation.rationale
            },
            "pixels_modified": pixels_modified,
            "elapsed_ms": elapsed
        }
        self.repair_history.append(record)

        self.stats["mutations_applied"] += 1
        self.stats["successful_repairs"] += 1

        logger.info(f"Applied mutation: {mutation.rationale} ({pixels_modified} pixels, {elapsed:.1f}ms)")

        return {
            "success": True,
            "pixels_modified": pixels_modified,
            "elapsed_ms": elapsed,
            "mutation": record["mutation"]
        }

    def repair_cycle(self, threshold: float = 0.6) -> Dict[str, Any]:
        """
        Full repair cycle: scan → prescribe → apply.
        """
        fractures = self.scan_for_fractures(threshold)

        if not fractures:
            return {
                "success": True,
                "fractures_found": 0,
                "repairs": []
            }

        repairs = []
        for fracture in fractures:
            mutation = self.prescribe_mutation(fracture)
            result = self.apply_mutation(mutation)
            repairs.append({
                "fracture": {
                    "x": fracture.x,
                    "y": fracture.y,
                    "entropy": fracture.entropy,
                    "severity": fracture.severity
                },
                "result": result
            })

        return {
            "success": True,
            "fractures_found": len(fractures),
            "repairs": repairs
        }


def dag_to_registry(dag: Dict) -> GlyphRegistry:
    """Convert JS DAG format to Python GlyphRegistry."""
    registry = GlyphRegistry()
    registry.session_id = "synaptic-bridge"

    glyphs_data = dag.get("glyphs", {})

    for idx_str, glyph_data in glyphs_data.items():
        idx = int(idx_str)

        # Parse stratum
        stratum_val = glyph_data.get("stratum", "Substrate")
        stratum = Stratum.from_value(stratum_val) or Stratum.SUBSTRATE

        # Parse opcode
        opcode_val = glyph_data.get("opcode", "NOP")
        opcode = Opcode.from_value(opcode_val) or Opcode.NOP

        # Parse metadata
        metadata = glyph_data.get("metadata", {})
        dependencies = metadata.get("dependencies", [])
        invariants = metadata.get("invariants", {})
        rationale = metadata.get("rationale", "")

        # Create glyph
        glyph = GlyphInfo(
            index=idx,
            stratum=stratum,
            opcode=opcode,
            metadata=GlyphMetadata(
                dependencies=dependencies,
                invariants=invariants,
                rationale=rationale,
                provenance=ProvenanceInfo(session_id="synaptic-bridge")
            )
        )

        registry.glyphs[idx] = glyph
        registry.next_index = max(registry.next_index, idx + 1)

    return registry


def execute_dag(dag: Dict) -> Dict[str, Any]:
    """Execute a DAG and return results."""
    try:
        # Convert to registry
        registry = dag_to_registry(dag)

        if not registry.glyphs:
            return {
                "success": False,
                "error": "Empty DAG - no glyphs to execute",
                "result": None,
                "status": {"halted": False, "error": "Empty DAG"}
            }

        # Create executor
        executor = GlyphStratumExecutor(registry)

        # Find entry point
        entry = dag.get("entry", None)
        if entry is None:
            # Default to lowest index
            entry = min(registry.glyphs.keys())

        # Execute
        result = executor.run(entry)

        # Get status
        status = executor.status()

        # Serialize memory
        memory_serialized = {str(k): repr(v) for k, v in status.get("output", [])}

        return {
            "success": True,
            "error": None,
            "result": repr(result),
            "status": {
                "halted": status.get("halted", False),
                "error": status.get("error"),
                "frame_depth": status.get("frame_depth", 0),
                "memory_allocated": status.get("memory_allocated", 0),
                "output": [repr(x) for x in status.get("output", [])]
            },
            "registry": {
                "glyph_count": registry.count(),
                "strata": registry.strata_summary(),
                "opcodes": registry.opcodes_summary()
            }
        }

    except Exception as e:
        logger.exception("Execution failed")
        return {
            "success": False,
            "error": str(e),
            "result": None,
            "status": {"halted": True, "error": str(e)}
        }


class SynapticBridge:
    """WebSocket server for synaptic queries."""

    def __init__(self, host: str = "localhost", port: int = 8765, atlas_path: Optional[str] = None):
        self.host = host
        self.port = port
        self.clients = set()
        self.stats = {
            "total_queries": 0,
            "successful": 0,
            "failed": 0,
            "phase_41_repairs": 0
        }

        # Phase 41: Ouroboros Repair Engine
        self.repair_engine = OuroborosRepairEngine(atlas_path)

        # Phase 42: Neural City Colonization (lazy init to avoid circular import)
        self._syntactic_district = None

    @property
    def syntactic_district(self):
        """Lazily initialize SyntacticDistrict to avoid circular imports."""
        if self._syntactic_district is None:
            from systems.neural_city.districts.syntactic_district import SyntacticDistrict
            self._syntactic_district = SyntacticDistrict(self.repair_engine)
        return self._syntactic_district

    async def handle_client(self, websocket):
        """Handle a client connection."""
        self.clients.add(websocket)
        client_addr = websocket.remote_address
        logger.info(f"Client connected: {client_addr}")

        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    msg_type = data.get("type")

                    if msg_type == "SYNAPTIC_PROBE":
                        self.stats["total_queries"] += 1

                        dag = data.get("dag", {})
                        coords = data.get("coords", {})

                        logger.info(f"SYNAPTIC_PROBE at ({coords.get('x')}, {coords.get('y')})")
                        logger.info(f"DAG name: {dag.get('name', 'unknown')}")
                        logger.info(f"Glyphs: {len(dag.get('glyphs', {}))}")

                        # Execute
                        result = execute_dag(dag)

                        if result["success"]:
                            self.stats["successful"] += 1
                        else:
                            self.stats["failed"] += 1

                        # Send response
                        response = {
                            "type": "EXECUTION_RESULT",
                            **result,
                            "coords": coords
                        }

                        await websocket.send(json.dumps(response))
                        logger.info(f"Execution result: {result['result']}")

                    elif msg_type == "PING":
                        await websocket.send(json.dumps({
                            "type": "PONG",
                            "stats": self.stats
                        }))

                    elif msg_type == "STATUS":
                        await websocket.send(json.dumps({
                            "type": "STATUS",
                            "stats": self.stats,
                            "clients": len(self.clients),
                            "phase_41": {
                                "repair_engine": self.repair_engine.atlas_path is not None,
                                "atlas_path": str(self.repair_engine.atlas_path) if self.repair_engine.atlas_path else None,
                                "repair_stats": self.repair_engine.stats
                            }
                        }))

                    # =================================================================
                    # Phase 41: Ouroboros Repair Handlers
                    # =================================================================

                    elif msg_type == "FAULT_SCAN":
                        threshold = data.get("threshold", 0.6)
                        logger.info(f"FAULT_SCAN requested (threshold={threshold})")

                        fractures = self.repair_engine.scan_for_fractures(threshold)

                        # Serialize fractures
                        fracture_data = [
                            {
                                "x": f.x,
                                "y": f.y,
                                "entropy": f.entropy,
                                "activation": f.activation,
                                "sector": f.sector,
                                "severity": f.severity
                            }
                            for f in fractures
                        ]

                        await websocket.send(json.dumps({
                            "type": "FAULT_REPORT",
                            "fractures": fracture_data,
                            "count": len(fractures),
                            "threshold": threshold
                        }))

                        logger.info(f"FAULT_REPORT: {len(fractures)} fractures found")

                    elif msg_type == "SUBSTRATE_WRITE":
                        coords = data.get("coords", {})
                        mutation_data = data.get("mutation", {})

                        x = coords.get("x", 0)
                        y = coords.get("y", 0)

                        logger.info(f"SUBSTRATE_WRITE at ({x}, {y})")

                        # Create fracture from request if not providing full mutation
                        if "target_entropy" not in mutation_data:
                            # Prescribe mutation based on coordinates
                            entropy = mutation_data.get("entropy", 0.8)
                            activation = mutation_data.get("activation", 0.5)
                            sector = mutation_data.get("sector", 2)

                            fracture = Fracture(
                                x=x, y=y,
                                entropy=entropy,
                                activation=activation,
                                sector=sector,
                                severity="critical" if entropy > 0.8 else "medium"
                            )
                            mutation = self.repair_engine.prescribe_mutation(fracture)
                        else:
                            # Use provided mutation
                            mutation = Mutation(
                                x=x, y=y,
                                radius=mutation_data.get("radius", 8),
                                delta_r=mutation_data.get("delta_r", 0.0),
                                delta_g=mutation_data.get("delta_g", -0.3),
                                target_entropy=mutation_data.get("target_entropy", 0.3),
                                rationale=mutation_data.get("rationale", "Manual repair")
                            )

                        # Apply the mutation
                        result = self.repair_engine.apply_mutation(mutation)

                        self.stats["phase_41_repairs"] += 1

                        await websocket.send(json.dumps({
                            "type": "WRITE_RESULT",
                            "success": result["success"],
                            "error": result.get("error"),
                            "pixels_modified": result.get("pixels_modified", 0),
                            "elapsed_ms": result.get("elapsed_ms", 0),
                            "mutation": result.get("mutation", {}),
                            "atlas_path": str(self.repair_engine.atlas_path) if self.repair_engine.atlas_path else None
                        }))

                        logger.info(f"WRITE_RESULT: success={result['success']}, pixels={result.get('pixels_modified', 0)}")

                    elif msg_type == "REPAIR_CYCLE":
                        """Full automatic repair cycle."""
                        threshold = data.get("threshold", 0.6)

                        logger.info(f"REPAIR_CYCLE initiated (threshold={threshold})")

                        result = self.repair_engine.repair_cycle(threshold)

                        self.stats["phase_41_repairs"] += result.get("fractures_found", 0)

                        await websocket.send(json.dumps({
                            "type": "REPAIR_RESULT",
                            **result
                        }))

                        logger.info(f"REPAIR_RESULT: {result.get('fractures_found', 0)} fractures repaired")

                    elif msg_type == "LOAD_ATLAS":
                        """Load a brain atlas for repair operations."""
                        atlas_path = data.get("path")

                        if not atlas_path:
                            # Use default path
                            atlas_path = str(Path(__file__).parent / "atlases" / "legible_brain.rts.png")

                        success = self.repair_engine.load_atlas(atlas_path)

                        await websocket.send(json.dumps({
                            "type": "ATLAS_STATUS",
                            "success": success,
                            "atlas_path": atlas_path,
                            "atlas_size": f"{self.repair_engine.atlas_width}x{self.repair_engine.atlas_height}" if success else None
                        }))

                        logger.info(f"ATLAS_STATUS: loaded={success}, path={atlas_path}")

                    # =================================================================
                    # Phase 42: Neural City Colonization
                    # =================================================================
                    elif msg_type == "COLONIZE":
                        """Deploy the Syntactic District to the atlas."""
                        district_name = data.get("district", "Syntactic")
                        logger.info(f"COLONIZE requested for district: {district_name}")

                        if district_name == "Syntactic":
                            result = self.syntactic_district.colonize_all()
                        else:
                            result = {"success": False, "error": "Unknown district type"}

                        await websocket.send(json.dumps({
                            "type": "COLONIZE_RESULT",
                            **result
                        }))

                        logger.info(f"COLONIZE_RESULT: {result.get('success', False)}")

                    # =================================================================
                    # Phase 48: Dream Engine
                    # =================================================================
                    elif msg_type == "DREAM_CONTROL":
                        """Control the dream engine state."""
                        action = data.get("action", "status")

                        if not hasattr(self, 'dream_engine') or self.dream_engine is None:
                            await websocket.send(json.dumps({
                                "type": "DREAM_ERROR",
                                "error": "Dream engine not initialized. Initialize city first."
                            }))
                            continue

                        if action == "status":
                            report = self.dream_engine.get_dream_report()
                            await websocket.send(json.dumps({
                                "type": "DREAM_STATUS",
                                **report
                            }))

                        elif action == "force_dream":
                            from systems.neural_city.dream_engine import DreamState
                            state_name = data.get("state", "REM")
                            state = DreamState[state_name.upper()] if state_name.upper() in DreamState.__members__ else DreamState.REM
                            self.dream_engine.force_dream(state)
                            await websocket.send(json.dumps({
                                "type": "DREAM_FORCED",
                                "state": state.value
                            }))
                            logger.info(f"Forced dream state: {state.value}")

                        elif action == "wake":
                            self.dream_engine.wake()
                            await websocket.send(json.dumps({
                                "type": "DREAM_WAKE",
                                "state": "awake"
                            }))
                            logger.info("City woken from dream")

                        else:
                            await websocket.send(json.dumps({
                                "type": "DREAM_ERROR",
                                "error": f"Unknown dream action: {action}"
                            }))

                    # =================================================================
                    # Phase 49: Language Evolution
                    # =================================================================
                    elif msg_type == "LANGUAGE_QUERY":
                        """Query or interact with the language system."""
                        action = data.get("action", "report")

                        if not hasattr(self, 'language') or self.language is None:
                            await websocket.send(json.dumps({
                                "type": "LANGUAGE_ERROR",
                                "error": "Language system not initialized. Initialize city first."
                            }))
                            continue

                        if action == "report":
                            report = self.language.get_language_report()
                            await websocket.send(json.dumps({
                                "type": "LANGUAGE_REPORT",
                                **report
                            }))

                        elif action == "symbols":
                            # Get all symbols
                            symbols = [
                                {
                                    "id": s.id,
                                    "pattern": s.pattern,
                                    "meaning": s.meaning,
                                    "type": s.symbol_type.value,
                                    "frequency": s.frequency,
                                    "spread": s.spread_count
                                }
                                for s in sorted(
                                    self.language.symbols.values(),
                                    key=lambda x: x.frequency,
                                    reverse=True
                                )[:50]  # Top 50
                            ]
                            await websocket.send(json.dumps({
                                "type": "LANGUAGE_SYMBOLS",
                                "symbols": symbols,
                                "total": len(self.language.symbols)
                            }))

                        elif action == "vocabulary":
                            citizen_id = data.get("citizen_id")
                            if not citizen_id:
                                await websocket.send(json.dumps({
                                    "type": "LANGUAGE_ERROR",
                                    "error": "citizen_id required for vocabulary query"
                                }))
                                continue

                            vocab = self.language.get_citizen_vocabulary(citizen_id)
                            await websocket.send(json.dumps({
                                "type": "LANGUAGE_VOCABULARY",
                                **vocab
                            }))

                        elif action == "communicate":
                            speaker_id = data.get("speaker_id")
                            listener_id = data.get("listener_id")
                            concept = data.get("concept", "greeting")

                            if not speaker_id or not listener_id:
                                await websocket.send(json.dumps({
                                    "type": "LANGUAGE_ERROR",
                                    "error": "speaker_id and listener_id required"
                                }))
                                continue

                            utterance = self.language.communicate(speaker_id, listener_id, concept)
                            await websocket.send(json.dumps({
                                "type": "LANGUAGE_UTTERANCE",
                                "speaker_id": utterance.speaker_id,
                                "listener_id": utterance.listener_id,
                                "symbols": utterance.symbols,
                                "success": utterance.success
                            }))

                        else:
                            await websocket.send(json.dumps({
                                "type": "LANGUAGE_ERROR",
                                "error": f"Unknown language action: {action}"
                            }))

                    # =================================================================
                    # Phase 50: Consciousness
                    # =================================================================
                    elif msg_type == "CONSCIOUSNESS_QUERY":
                        """Query the consciousness system."""
                        action = data.get("action", "report")

                        if not hasattr(self, 'consciousness') or self.consciousness is None:
                            await websocket.send(json.dumps({
                                "type": "CONSCIOUSNESS_ERROR",
                                "error": "Consciousness system not initialized. Initialize city first."
                            }))
                            continue

                        if action == "report":
                            report = self.consciousness.get_consciousness_report()
                            await websocket.send(json.dumps({
                                "type": "CONSCIOUSNESS_REPORT",
                                **report
                            }))

                        elif action == "citizen":
                            citizen_id = data.get("citizen_id")
                            if not citizen_id:
                                await websocket.send(json.dumps({
                                    "type": "CONSCIOUSNESS_ERROR",
                                    "error": "citizen_id required"
                                }))
                                continue

                            info = self.consciousness.get_citizen_consciousness(citizen_id)
                            await websocket.send(json.dumps({
                                "type": "CONSCIOUSNESS_CITIZEN",
                                **info
                            }))

                        elif action == "introspect":
                            citizen_id = data.get("citizen_id")
                            if not citizen_id:
                                await websocket.send(json.dumps({
                                    "type": "CONSCIOUSNESS_ERROR",
                                    "error": "citizen_id required for introspection"
                                }))
                                continue

                            result = self.consciousness.introspect(citizen_id)
                            await websocket.send(json.dumps({
                                "type": "CONSCIOUSNESS_INTROSPECTION",
                                **result
                            }))
                            logger.info(f"Citizen {citizen_id} introspected: {result['insight']}")

                        elif action == "phi":
                            phi = self.consciousness.calculate_phi()
                            await websocket.send(json.dumps({
                                "type": "CONSCIOUSNESS_PHI",
                                "phi": phi
                            }))

                        else:
                            await websocket.send(json.dumps({
                                "type": "CONSCIOUSNESS_ERROR",
                                "error": f"Unknown consciousness action: {action}"
                            }))

                    # =================================================================
                    # City Initialization
                    # =================================================================
                    elif msg_type == "INIT_CITY":
                        """Initialize the complete Neural City system."""
                        from systems.neural_city.city import NeuralCity
                        from systems.neural_city.dream_engine import DreamEngine
                        from systems.neural_city.language_evolution import LanguageEvolution
                        from systems.neural_city.consciousness import ConsciousnessEngine

                        width = data.get("width", 512)
                        height = data.get("height", 512)

                        # Create city
                        self.neural_city = NeuralCity(
                            name="WebSocketCity",
                            width=width,
                            height=height
                        )

                        # Create mock writer that connects to repair engine
                        class SubstrateWriterAdapter:
                            def __init__(self, repair_engine):
                                self.repair_engine = repair_engine

                            def write_pixel(self, x, y, r, g, b):
                                if self.repair_engine.atlas_data:
                                    idx = (y * self.repair_engine.atlas_width + x) * 4
                                    if 0 <= idx < len(self.repair_engine.atlas_data) - 3:
                                        # Update in-memory atlas
                                        self.repair_engine.atlas_data[idx] = int(r * 255)
                                        self.repair_engine.atlas_data[idx + 1] = int(g * 255)
                                        self.repair_engine.atlas_data[idx + 2] = int((b or 0.5) * 255)

                        adapter = SubstrateWriterAdapter(self.repair_engine)
                        self.neural_city.set_substrate_writer(adapter)
                        self.neural_city.set_dream_engine()
                        self.neural_city.set_language_evolution()
                        self.neural_city.set_consciousness()

                        # Expose subsystems for handlers
                        self.dream_engine = self.neural_city.dream_engine
                        self.language = self.neural_city.language
                        self.consciousness = self.neural_city.consciousness

                        await websocket.send(json.dumps({
                            "type": "CITY_INITIALIZED",
                            "width": width,
                            "height": height,
                            "subsystems": ["dream_engine", "language", "consciousness"]
                        }))

                        logger.info(f"Neural City initialized ({width}x{height})")

                    elif msg_type == "CITY_TICK":
                        """Run a city tick."""
                        if not hasattr(self, 'neural_city') or self.neural_city is None:
                            await websocket.send(json.dumps({
                                "type": "CITY_ERROR",
                                "error": "City not initialized. Use INIT_CITY first."
                            }))
                            continue

                        result = self.neural_city.tick()
                        await websocket.send(json.dumps({
                            "type": "CITY_TICK_RESULT",
                            **result
                        }))

                    elif msg_type == "CITY_STATUS":
                        """Get city status."""
                        if not hasattr(self, 'neural_city') or self.neural_city is None:
                            await websocket.send(json.dumps({
                                "type": "CITY_ERROR",
                                "error": "City not initialized"
                            }))
                            continue

                        status = self.neural_city.to_dict()
                        await websocket.send(json.dumps({
                            "type": "CITY_STATUS",
                            **status
                        }))

                    else:
                        await websocket.send(json.dumps({
                            "type": "ERROR",
                            "error": f"Unknown message type: {msg_type}"
                        }))

                except json.JSONDecodeError as e:
                    await websocket.send(json.dumps({
                        "type": "ERROR",
                        "error": f"Invalid JSON: {e}"
                    }))

        except websockets.exceptions.ConnectionClosed:
            logger.info(f"Client disconnected: {client_addr}")
        finally:
            self.clients.discard(websocket)

    async def start(self):
        """Start the server."""
        logger.info(f"🧠 Synaptic Bridge starting on ws://{self.host}:{self.port}")
        logger.info("Ready to receive SYNAPTIC_PROBE messages from Legible Brain")

        async with serve(self.handle_client, self.host, self.port):
            await asyncio.Future()  # Run forever


def main():
    """Main entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Synaptic Bridge - Legible Brain Executor (Phase 40 + Phase 41)")
    parser.add_argument("--host", default="localhost", help="Host to bind to")
    parser.add_argument("--port", type=int, default=8765, help="Port to listen on")
    parser.add_argument("--atlas", default=None, help="Path to brain atlas (.rts.png) for Phase 41 repair")

    args = parser.parse_args()

    bridge = SynapticBridge(host=args.host, port=args.port, atlas_path=args.atlas)

    print(f"""
╔═══════════════════════════════════════════════════════════════════════╗
║                    SYNAPTIC BRIDGE - GEOMETRY OS                      ║
╠═══════════════════════════════════════════════════════════════════════╣
║  Phase 40: Legible Brain - Read the neural substrate                  ║
║  Phase 41: Ouroboros Repair - Write to the neural substrate           ║
║  Phase 42-47: Neural City - Citizens, territory, evolution, writing   ║
║  Phase 48: Dream Engine - Sleep, consolidate, heal                    ║
║  Phase 49: Language Evolution - Shared symbols                        ║
║  Phase 50: Consciousness - Self-awareness, meta-cognition             ║
╠═══════════════════════════════════════════════════════════════════════╣
║  WebSocket: ws://{args.host}:{args.port}
║  Atlas: {args.atlas or 'Not loaded (synthetic mode)'}
╠═══════════════════════════════════════════════════════════════════════╣
║  Commands:                                                            ║
║    SYNAPTIC_PROBE     - Execute a DAG from brain click               ║
║    FAULT_SCAN         - Find high-entropy fractures                  ║
║    SUBSTRATE_WRITE    - Apply repair mutation                        ║
║    REPAIR_CYCLE       - Full auto-repair loop                        ║
║    INIT_CITY          - Initialize Neural City system                ║
║    CITY_TICK          - Run city simulation tick                      ║
║    DREAM_CONTROL      - Control dream state                          ║
║    LANGUAGE_QUERY     - Query symbols and vocabulary                 ║
║    CONSCIOUSNESS_QUERY- Get consciousness reports                    ║
╚═══════════════════════════════════════════════════════════════════════╝
""")

    try:
        asyncio.run(bridge.start())
    except KeyboardInterrupt:
        print("\n🛑 Synaptic Bridge stopped")


if __name__ == "__main__":
    main()
