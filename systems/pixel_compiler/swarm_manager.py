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

    def load_bytecode(self, wasm_bytes: bytes) -> None:
        """
        Upload shared WASM bytecode to GPU.

        All agents will execute this same bytecode.
        Must be called before spawning agents.

        Args:
            wasm_bytes: WASM bytecode to upload
        """
        if self.mock:
            self._mock_bytecode = wasm_bytes
            self._bytecode_loaded = True
            self._bytecode_size = len(wasm_bytes)
            return

        # GPU mode: create/update bytecode buffer
        # Pad to 4-byte alignment for u32 access
        padded_size = ((len(wasm_bytes) + 3) // 4) * 4
        padded_wasm = wasm_bytes + b'\x00' * (padded_size - len(wasm_bytes))

        bytecode_array = np.frombuffer(padded_wasm, dtype=np.uint8)

        if self.bytecode_buffer is None or self.bytecode_buffer.size < padded_size:
            self.bytecode_buffer = self.device.create_buffer_with_data(
                data=bytecode_array,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST
            )
        else:
            self.device.queue.write_buffer(self.bytecode_buffer, 0, bytecode_array.tobytes())

        self._bytecode_loaded = True
        self._bytecode_size = len(wasm_bytes)

    def spawn_agent(self,
                    entry_point: int = 0,
                    memory_init: bytes = None,
                    args: List[int] = None) -> int:
        """
        Spawn a new agent instance.

        Args:
            entry_point: WASM function index to start execution
            memory_init: Initial bytes for agent's linear memory
            args: Arguments to pass via globals[1], globals[2], etc.

        Returns:
            agent_id: Unique identifier for this agent

        Raises:
            RuntimeError: If bytecode not loaded or capacity exceeded
        """
        if not self._bytecode_loaded:
            raise RuntimeError("Must call load_bytecode() before spawning agents")

        if not self.free_slots:
            raise RuntimeError(f"Swarm at capacity ({self.MAX_AGENTS} agents)")

        # Assign slot
        slot = self.free_slots.pop(0)
        agent_id = self.next_agent_id
        self.next_agent_id += 1

        # Track agent
        self.active_agents[agent_id] = AgentState(
            agent_id=agent_id,
            pool_slot=slot,
            entry_point=entry_point
        )
        self.slot_assignments[agent_id] = slot

        # Initialize memory
        if memory_init:
            self.set_agent_memory(agent_id, memory_init)

        # Initialize globals with arguments
        globals_base = slot * self.GLOBALS_PER_AGENT
        if args:
            for i, arg in enumerate(args):
                global_idx = globals_base + 1 + i  # globals[0] is return value
                if global_idx < globals_base + self.GLOBALS_PER_AGENT:
                    if self.mock:
                        self._mock_globals[global_idx] = arg
                    else:
                        # Will be batched on dispatch
                        pass

        return agent_id

    def set_agent_memory(self, agent_id: int, data: bytes) -> None:
        """
        Write to agent's linear memory.

        Args:
            agent_id: Agent to write to
            data: Bytes to write

        Raises:
            KeyError: If agent_id not found
            ValueError: If data exceeds 64KB
        """
        if agent_id not in self.active_agents:
            raise KeyError(f"Agent {agent_id} not found")

        if len(data) > self.AGENT_MEMORY_SIZE:
            raise ValueError(f"Data ({len(data)}) exceeds agent memory ({self.AGENT_MEMORY_SIZE})")

        slot = self.active_agents[agent_id].pool_slot
        memory_base = slot * self.AGENT_MEMORY_SIZE

        if self.mock:
            self._mock_pool[memory_base:memory_base + len(data)] = data
            return

        # GPU mode: write to pool buffer
        data_array = np.frombuffer(data, dtype=np.uint8)
        self.device.queue.write_buffer(self.pool_buffer, memory_base, data_array.tobytes())
