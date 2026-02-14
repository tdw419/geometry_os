# systems/pixel_compiler/swarm_manager.py
"""
SwarmManager - Parallel WASM agent execution on GPU.

Supports up to 1024 concurrent agents with 64KB memory each.
"""

from typing import Dict, List, Optional
from dataclasses import dataclass, field
import numpy as np

try:
    import wgpu
except ImportError:
    wgpu = None


@dataclass
class AgentState:
    """Tracks active agent state."""
    agent_id: int
    pool_slot: int
    entry_point: int
    is_active: bool = True


@dataclass
class SwarmResult:
    """Results from a swarm dispatch."""
    agent_results: Dict[int, int] = field(default_factory=dict)
    agent_outputs: Dict[int, bytes] = field(default_factory=dict)
    instruction_counts: Dict[int, int] = field(default_factory=dict)
    total_time_ms: float = 0.0


class SwarmManager:
    """
    Manages parallel WASM agent execution on GPU.

    Supports up to 1024 concurrent agents with 64KB memory each.
    Uses workgroup-per-instance dispatch for maximum isolation.
    """

    MAX_AGENTS = 1024
    AGENT_MEMORY_SIZE = 64 * 1024  # 64KB per agent
    GLOBALS_PER_AGENT = 16
    OUTPUT_SIZE_PER_AGENT = 4096  # 4KB per agent

    def __init__(self, shader_path: str = None):
        """Initialize SwarmManager with optional custom shader."""
        self.mock = wgpu is None

        # Agent tracking
        self.active_agents: Dict[int, AgentState] = {}
        self.slot_assignments: Dict[int, int] = {}  # agent_id -> slot
        self.free_slots: List[int] = list(range(self.MAX_AGENTS))
        self.next_agent_id = 0

        # Buffers (initialized on demand)
        self.device = None
        self.pool_buffer = None
        self.globals_buffer = None
        self.output_buffer = None
        self.bytecode_buffer = None
        self.config_buffer = None
        self.pipeline = None

        # Bytecode state
        self._bytecode_loaded = False
        self._bytecode_size = 0

        if not self.mock:
            self._init_gpu(shader_path)
        else:
            # Mock mode storage
            self._mock_pool = bytearray(self.MAX_AGENTS * self.AGENT_MEMORY_SIZE)
            self._mock_globals = np.zeros(self.MAX_AGENTS * self.GLOBALS_PER_AGENT, dtype=np.uint32)
            self._mock_bytecode = b""
            self._mock_output = np.zeros(self.MAX_AGENTS * self.OUTPUT_SIZE_PER_AGENT, dtype=np.uint32)

    def _init_gpu(self, shader_path: str = None):
        """Initialize GPU device and buffers."""
        from pathlib import Path

        try:
            adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
            self.device = adapter.request_device(required_features=[])

            # Create buffers
            pool_size = self.MAX_AGENTS * self.AGENT_MEMORY_SIZE
            globals_size = self.MAX_AGENTS * self.GLOBALS_PER_AGENT * 4
            output_size = self.MAX_AGENTS * self.OUTPUT_SIZE_PER_AGENT * 4

            self.pool_buffer = self.device.create_buffer(
                size=pool_size,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
            )
            self.globals_buffer = self.device.create_buffer(
                size=globals_size,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
            )
            self.output_buffer = self.device.create_buffer(
                size=output_size,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
            )
            self.config_buffer = self.device.create_buffer(
                size=32,  # 8 u32 values
                usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST
            )

            # Load shader
            if shader_path is None:
                workspace_root = Path(__file__).parent.parent.parent
                shader_path = str(workspace_root / "pixelrts_v2" / "shaders" / "wasm_swarm.wgsl")

            self._create_pipeline(shader_path)

        except Exception as e:
            print(f"Warning: GPU init failed: {e}. Using mock mode.")
            self.mock = True
            self._mock_pool = bytearray(self.MAX_AGENTS * self.AGENT_MEMORY_SIZE)
            self._mock_globals = np.zeros(self.MAX_AGENTS * self.GLOBALS_PER_AGENT, dtype=np.uint32)

    def _create_pipeline(self, shader_path: str):
        """Create compute pipeline from shader."""
        # Pipeline creation deferred until shader exists
        pass
