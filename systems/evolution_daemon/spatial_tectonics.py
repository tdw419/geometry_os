"""
Spatial Tectonics Consensus Engine - Phase 28

Monitors NeuralPulseSystem events and proposes layout realignments
to reduce Saccade distance for Area Agents.

Architecture:
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│ NeuralPulse     │ ──► │ ConsensusEngine │ ──► │ TectonicProposal│
│ System (JS)     │     │ (Python)        │     │ → Rust Solver   │
└─────────────────┘     └─────────────────┘     └─────────────────┘

Integration Points:
- neural_memory_hub.py: Read NeuralPulse events
- Visual Bridge: WebSocket to Rust TectonicSimulator
- VAT (Visual Allocation Table): Apply layout deltas
"""

import asyncio
import json
import logging
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from pathlib import Path
from typing import Dict, List, Optional, Any, Callable
from collections import defaultdict
import time

logger = logging.getLogger("spatial_tectonics.consensus")


@dataclass
class PulseEvent:
    """A NeuralPulse event from NeuralPulseSystem.js"""
    source_tile: int
    dest_tile: int
    pulse_type: str  # 'violet' (cognitive) or 'cyan' (semantic)
    volume: float
    timestamp: float

    @classmethod
    def from_dict(cls, data: dict) -> "PulseEvent":
        return cls(
            source_tile=data.get("source", 0),
            dest_tile=data.get("dest", 0),
            pulse_type=data.get("pulse_type", "violet"),
            volume=data.get("volume", 1.0),
            timestamp=data.get("timestamp", time.time() * 1000) / 1000.0
        )


@dataclass
class TectonicProposal:
    """A proposed layout realignment"""
    proposal_id: str
    bonds: List[Dict[str, Any]]
    expected_saccade_improvement: float
    aggregation_window_start: float
    aggregation_window_end: float
    pulse_count: int
    created_at: datetime = field(default_factory=datetime.now)


class ConsensusEngine:
    """
    Aggregates NeuralPulse events and proposes layout realignments.

    The engine monitors pulse volume between tiles over a 60-second window,
    identifies cognitive bonds (high-traffic edges), and proposes
    realignments to the Rust TectonicSimulator.
    """

    def __init__(
        self,
        aggregation_window_secs: int = 60,
        min_pulse_count: int = 10,
        min_bond_strength: float = 0.1,
        pulse_callback: Optional[Callable[[PulseEvent], None]] = None
    ):
        self.aggregation_window_secs = aggregation_window_secs
        self.min_pulse_count = min_pulse_count
        self.min_bond_strength = min_bond_strength
        self.pulse_callback = pulse_callback

        # State
        self.pulse_buffer: List[PulseEvent] = []
        self.edge_volumes: Dict[tuple, float] = defaultdict(float)
        self.edge_counts: Dict[tuple, int] = defaultdict(int)
        self.edge_types: Dict[tuple, str] = {}

        self.last_proposal: Optional[TectonicProposal] = None
        self.proposal_history: List[TectonicProposal] = []
        self.running = False
        self._task: Optional[asyncio.Task] = None

    async def start(self):
        """Start the consensus engine."""
        if self.running:
            return

        self.running = True
        self._task = asyncio.create_task(self._aggregation_loop())
        logger.info(f"ConsensusEngine started (window: {self.aggregation_window_secs}s)")

    async def stop(self):
        """Stop the consensus engine."""
        self.running = False
        if self._task:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass
        logger.info("ConsensusEngine stopped")

    def record_pulse(self, event: PulseEvent):
        """Record a pulse event from NeuralPulseSystem."""
        self.pulse_buffer.append(event)

        # Normalize edge key (smaller id first)
        edge_key = tuple(sorted([event.source_tile, event.dest_tile]))

        # Update volumes
        self.edge_volumes[edge_key] += event.volume
        self.edge_counts[edge_key] += 1

        # Track edge type
        if edge_key not in self.edge_types:
            self.edge_types[edge_key] = event.pulse_type
        elif self.edge_types[edge_key] != event.pulse_type:
            self.edge_types[edge_key] = "hybrid"

        # Callback for external processing
        if self.pulse_callback:
            self.pulse_callback(event)

    async def _aggregation_loop(self):
        """Periodically aggregate and propose realignments."""
        while self.running:
            await asyncio.sleep(self.aggregation_window_secs)

            if len(self.pulse_buffer) >= self.min_pulse_count:
                proposal = await self._create_proposal()
                if proposal:
                    self.last_proposal = proposal
                    self.proposal_history.append(proposal)
                    logger.info(
                        f"Created proposal {proposal.proposal_id}: "
                        f"{len(proposal.bonds)} bonds, "
                        f"+{proposal.expected_saccade_improvement:.1f}% saccade improvement"
                    )

                # Clear buffer for next window
                self._clear_buffer()

    async def _create_proposal(self) -> Optional[TectonicProposal]:
        """Create a realignment proposal from aggregated data."""
        if not self.edge_volumes:
            return None

        # Find max volume for normalization
        max_volume = max(self.edge_volumes.values()) if self.edge_volumes else 1.0

        # Build bonds list
        bonds = []
        for edge_key, volume in self.edge_volumes.items():
            strength = volume / max_volume

            if strength >= self.min_bond_strength:
                bonds.append({
                    "source": edge_key[0],
                    "dest": edge_key[1],
                    "strength": strength,
                    "volume": volume,
                    "pulse_count": self.edge_counts[edge_key],
                    "bond_type": self.edge_types.get(edge_key, "unknown")
                })

        if not bonds:
            return None

        # Sort by strength descending
        bonds.sort(key=lambda b: b["strength"], reverse=True)

        # Estimate saccade improvement (heuristic)
        # Stronger bonds = more potential for improvement
        avg_strength = sum(b["strength"] for b in bonds) / len(bonds)
        expected_improvement = avg_strength * 30  # Heuristic: 30% max

        window_start = min(e.timestamp for e in self.pulse_buffer) if self.pulse_buffer else time.time()
        window_end = max(e.timestamp for e in self.pulse_buffer) if self.pulse_buffer else time.time()

        return TectonicProposal(
            proposal_id=f"prop-{datetime.now().strftime('%Y%m%d%H%M%S')}",
            bonds=bonds,
            expected_saccade_improvement=expected_improvement,
            aggregation_window_start=window_start,
            aggregation_window_end=window_end,
            pulse_count=len(self.pulse_buffer)
        )

    def _clear_buffer(self):
        """Clear the pulse buffer for next aggregation window."""
        self.pulse_buffer.clear()
        self.edge_volumes.clear()
        self.edge_counts.clear()
        self.edge_types.clear()

    def get_top_bonds(self, n: int = 10) -> List[Dict[str, Any]]:
        """Get the top N bonds by strength."""
        if not self.edge_volumes:
            return []

        max_volume = max(self.edge_volumes.values())
        bonds = []

        for edge_key, volume in self.edge_volumes.items():
            strength = volume / max_volume
            bonds.append({
                "source": edge_key[0],
                "dest": edge_key[1],
                "strength": strength,
                "volume": volume,
                "count": self.edge_counts[edge_key],
                "type": self.edge_types.get(edge_key, "unknown")
            })

        bonds.sort(key=lambda b: b["strength"], reverse=True)
        return bonds[:n]

    def get_stats(self) -> Dict[str, Any]:
        """Get engine statistics."""
        return {
            "running": self.running,
            "pulse_buffer_size": len(self.pulse_buffer),
            "active_edges": len(self.edge_volumes),
            "total_pulse_count": sum(self.edge_counts.values()),
            "total_volume": sum(self.edge_volumes.values()),
            "window_secs": self.aggregation_window_secs,
            "proposals_created": len(self.proposal_history),
            "last_proposal_id": self.last_proposal.proposal_id if self.last_proposal else None
        }

    def to_tectonic_message(self) -> Dict[str, Any]:
        """Convert current state to message for Rust TectonicSimulator."""
        return {
            "type": "tectonic_aggregation",
            "bonds": self.get_top_bonds(100),
            "stats": self.get_stats(),
            "timestamp": time.time() * 1000
        }


class TectonicBridge:
    """
    Bridge between ConsensusEngine and Rust TectonicSimulator.

    Handles WebSocket communication and proposal submission.
    """

    def __init__(
        self,
        consensus_engine: ConsensusEngine,
        visual_bridge_url: str = "ws://localhost:8768"
    ):
        self.consensus = consensus_engine
        self.visual_bridge_url = visual_bridge_url
        self.ws = None

    async def connect(self):
        """Connect to Visual Bridge."""
        try:
            import websockets
            self.ws = await websockets.connect(self.visual_bridge_url)
            logger.info(f"Connected to Visual Bridge at {self.visual_bridge_url}")
        except Exception as e:
            logger.warning(f"Failed to connect to Visual Bridge: {e}")
            self.ws = None

    async def submit_proposal(self, proposal: TectonicProposal) -> bool:
        """Submit a realignment proposal to the Rust simulator."""
        if not self.ws:
            await self.connect()

        if not self.ws:
            logger.warning("Cannot submit proposal: not connected")
            return False

        message = {
            "type": "tectonic_proposal",
            "proposal_id": proposal.proposal_id,
            "bonds": proposal.bonds,
            "expected_improvement": proposal.expected_saccade_improvement,
            "pulse_count": proposal.pulse_count,
            "timestamp": time.time() * 1000
        }

        try:
            await self.ws.send(json.dumps(message))
            logger.info(f"Submitted proposal {proposal.proposal_id}")
            return True
        except Exception as e:
            logger.error(f"Failed to submit proposal: {e}")
            self.ws = None
            return False

    async def close(self):
        """Close the connection."""
        if self.ws:
            await self.ws.close()
            self.ws = None


# Integration with Visual Bridge
async def setup_spatial_tectonics(visual_bridge=None) -> ConsensusEngine:
    """
    Set up spatial tectonics integration.

    Args:
        visual_bridge: Optional Visual Bridge instance for WebSocket

    Returns:
        Initialized ConsensusEngine
    """
    engine = ConsensusEngine(
        aggregation_window_secs=60,
        min_pulse_count=10,
        min_bond_strength=0.1
    )

    await engine.start()

    # Wire to visual bridge if provided
    if visual_bridge:
        def on_pulse(event: PulseEvent):
            # Forward to visual bridge for HUD display
            visual_bridge.broadcast({
                "type": "tectonic_pulse",
                "source": event.source_tile,
                "dest": event.dest_tile,
                "pulse_type": event.pulse_type,
                "volume": event.volume
            })

        engine.pulse_callback = on_pulse

    return engine


if __name__ == "__main__":
    # Demo
    async def demo():
        engine = await setup_spatial_tectonics()

        # Simulate some pulses
        for i in range(100):
            event = PulseEvent(
                source_tile=i % 5,
                dest_tile=(i + 1) % 5,
                pulse_type="violet" if i % 2 == 0 else "cyan",
                volume=1.0 + (i % 3) * 0.5,
                timestamp=time.time()
            )
            engine.record_pulse(event)

        print("Stats:", json.dumps(engine.get_stats(), indent=2))
        print("\nTop bonds:", json.dumps(engine.get_top_bonds(5), indent=2))

        await engine.stop()

    asyncio.run(demo())
