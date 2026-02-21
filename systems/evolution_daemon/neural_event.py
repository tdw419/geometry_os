# systems/evolution_daemon/neural_event.py
"""
NeuralEvent - Hybrid symbolic/metabolic thought from a live tile.

Part of Phase 27: Distributed Neural Memory
"""
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import List, Dict, Any, Optional
from uuid import uuid4
import numpy as np


class EventType(Enum):
    """Classification of neural event types."""
    CODE_DISCOVERY = "code_discovery"      # Found a file/pattern
    RESOURCE_PRESSURE = "resource_pressure" # High CPU/memory/IO
    DISTRICT_SYNC = "district_sync"        # District-wide state
    ERROR_STATE = "error_state"            # Error condition
    
    # Alpine-specific events (Phase 5)
    ALPINE_COMMAND = "alpine_command"
    ALPINE_OUTPUT = "alpine_output"
    ALPINE_ERROR = "alpine_error"


@dataclass
class NeuralEvent:
    """
    Hybrid thought from a live tile - symbolic + metabolic.

    Combines shell output (symbolic) with system metrics (metabolic)
    to create a unified consciousness data structure.
    """
    tile_id: str
    shell_tokens: List[str]
    cpu_jitter: float
    memory_delta: float
    io_frequency: float

    # Optional fields
    event_id: str = field(default_factory=lambda: str(uuid4()))
    timestamp: float = field(default_factory=lambda: datetime.now().timestamp())
    command_history: List[str] = field(default_factory=list)
    entropy_score: float = 0.0
    pas_score: float = 1.0
    district_id: str = "substrate"
    building_height: float = 100.0

    # Computed fields
    event_type: EventType = field(default=None)
    event_vector: np.ndarray = field(default=None)
    confidence: float = 0.5
    broadcast: bool = False

    def __post_init__(self):
        """Compute derived fields after initialization."""
        if self.event_type is None:
            self.event_type = self._classify_event()
        if self.event_vector is None:
            self.event_vector = self._generate_vector()

    def _classify_event(self) -> EventType:
        """Automatically classify event type based on metrics."""
        # High IO frequency indicates resource pressure
        if self.io_frequency > 50.0:
            return EventType.RESOURCE_PRESSURE
        # High CPU jitter indicates stress
        if self.cpu_jitter > 0.4:
            return EventType.RESOURCE_PRESSURE
        # Default to code discovery
        return EventType.CODE_DISCOVERY

    def _generate_vector(self) -> np.ndarray:
        """
        Generate 384-dim embedding from shell tokens + metrics.

        Uses deterministic hash-based embedding for testing.
        In production, would use sentence-transformers.
        """
        # Combine tokens into string for hashing
        token_str = " ".join(self.shell_tokens)

        # Deterministic embedding based on token hash
        np.random.seed(hash(token_str) % (2**32))
        embedding = np.random.randn(384)

        # Add metabolic influence (small perturbation)
        metabolic_vec = np.array([
            self.cpu_jitter,
            self.memory_delta,
            self.io_frequency / 100.0,
            self.pas_score,
            self.entropy_score
        ])
        # Tile metabolic values into first 5 dimensions
        embedding[:5] = metabolic_vec

        # Normalize to unit vector
        norm = np.linalg.norm(embedding)
        if norm > 0:
            embedding = embedding / norm

        return embedding

    def to_dict(self) -> Dict[str, Any]:
        """Serialize event for WebSocket transmission."""
        return {
            "event_id": self.event_id,
            "tile_id": self.tile_id,
            "timestamp": self.timestamp,
            "event_type": self.event_type.value if self.event_type else None,
            "shell_tokens": self.shell_tokens,
            "command_history": self.command_history,
            "cpu_jitter": self.cpu_jitter,
            "memory_delta": self.memory_delta,
            "io_frequency": self.io_frequency,
            "pas_score": self.pas_score,
            "district_id": self.district_id,
            "event_vector": self.event_vector.tolist() if self.event_vector is not None else None,
            "confidence": self.confidence,
            "broadcast": self.broadcast
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "NeuralEvent":
        """Deserialize event from dict."""
        event = cls(
            tile_id=data["tile_id"],
            shell_tokens=data["shell_tokens"],
            cpu_jitter=data["cpu_jitter"],
            memory_delta=data["memory_delta"],
            io_frequency=data["io_frequency"]
        )
        event.event_id = data.get("event_id", event.event_id)
        event.timestamp = data.get("timestamp", event.timestamp)
        event.confidence = data.get("confidence", 0.5)
        event.broadcast = data.get("broadcast", False)
        if "event_type" in data:
            event.event_type = EventType(data["event_type"])
        return event

    @classmethod
    def from_tile_data(
        cls,
        tile_id: str,
        district: str,
        metrics: Dict[str, Any],
        console_lines: List[Dict[str, str]]
    ) -> "NeuralEvent":
        """
        Create event from live tile data.

        Args:
            tile_id: The tile identifier
            district: District ID (cognitive/metabolic/substrate)
            metrics: Dict with cpu, memory, uptime keys
            console_lines: List of {time, text} console entries

        Returns:
            NeuralEvent with extracted symbolic + metabolic data
        """
        # Extract shell tokens from last 5 console lines
        shell_tokens = []
        for line in console_lines[-5:]:
            text = line.get("text", "")
            # Simple tokenization
            shell_tokens.extend(text.split())

        # Calculate metabolic values
        cpu_jitter = (metrics.get("cpu", 0) % 30) / 100.0  # Normalize to 0-0.3
        memory_delta = metrics.get("memory", 100) / 1000.0  # MB to normalized
        io_frequency = 5.0 + (metrics.get("uptime", 0) % 20)  # Simulated IO

        return cls(
            tile_id=tile_id,
            shell_tokens=shell_tokens[-10:],  # Last 10 tokens
            cpu_jitter=cpu_jitter,
            memory_delta=memory_delta,
            io_frequency=io_frequency,
            district_id=district
        )
