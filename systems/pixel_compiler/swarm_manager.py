# systems/pixel_compiler/swarm_manager.py
"""
SwarmManager - Parallel WASM agent execution on GPU.

Supports up to 1024 concurrent agents with 64KB memory each.
"""

from typing import Dict, List, Optional
from dataclasses import dataclass, field
import time
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

        # Assign slot (LIFO for quick reuse of freed slots)
        slot = self.free_slots.pop()
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

    def get_agent_memory(self, agent_id: int, size: int = None) -> bytes:
        """
        Read agent's linear memory.

        Args:
            agent_id: Agent to read from
            size: Number of bytes to read (default: full 64KB)

        Returns:
            Bytes from agent's memory

        Raises:
            KeyError: If agent_id not found
        """
        if agent_id not in self.active_agents:
            raise KeyError(f"Agent {agent_id} not found")

        slot = self.active_agents[agent_id].pool_slot
        memory_base = slot * self.AGENT_MEMORY_SIZE

        if size is None:
            size = self.AGENT_MEMORY_SIZE

        original_size = size

        if self.mock:
            return bytes(self._mock_pool[memory_base:memory_base + size])

        # GPU mode: pad size to 4-byte alignment for COPY_BUFFER_ALIGNMENT
        padded_size = ((size + 3) // 4) * 4
        data = self.device.queue.read_buffer(self.pool_buffer, memory_base, padded_size)
        # Return only the requested amount
        return data.tobytes()[:original_size]

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

        # GPU mode: pad data to 4-byte alignment for COPY_BUFFER_ALIGNMENT
        padded_len = ((len(data) + 3) // 4) * 4
        if padded_len != len(data):
            data = data + b'\x00' * (padded_len - len(data))

        data_array = np.frombuffer(data, dtype=np.uint8)
        self.device.queue.write_buffer(self.pool_buffer, memory_base, data_array.tobytes())

    def kill_agent(self, agent_id: int) -> None:
        """
        Remove an agent and free its pool slot.

        Args:
            agent_id: ID of agent to remove

        Raises:
            KeyError: If agent_id not found
        """
        if agent_id not in self.active_agents:
            raise KeyError(f"Agent {agent_id} not found")

        state = self.active_agents[agent_id]
        slot = state.pool_slot

        # Remove from tracking
        del self.active_agents[agent_id]
        del self.slot_assignments[agent_id]

        # Free slot for reuse
        self.free_slots.append(slot)

    def dispatch(self, agent_ids: List[int] = None, max_instructions: int = 10000) -> SwarmResult:
        """
        Execute agents in parallel on GPU.

        Args:
            agent_ids: Specific agents to run, or None for all active
            max_instructions: Execution limit per agent

        Returns:
            SwarmResult with per-agent return values and outputs
        """
        start_time = time.time()

        # Determine which agents to dispatch
        if agent_ids is None:
            agents_to_run = list(self.active_agents.keys())
        else:
            agents_to_run = [aid for aid in agent_ids if aid in self.active_agents]

        if not agents_to_run:
            return SwarmResult()

        # Determine max slot for dispatch count
        max_slot = max(self.active_agents[aid].pool_slot for aid in agents_to_run)
        active_count = max_slot + 1

        result = SwarmResult()

        if self.mock:
            # Mock execution: simulate results
            for agent_id in agents_to_run:
                state = self.active_agents[agent_id]
                globals_base = state.pool_slot * self.GLOBALS_PER_AGENT

                # Mock: return globals[0] or 0
                return_val = int(self._mock_globals[globals_base]) if globals_base < len(self._mock_globals) else 0
                result.agent_results[agent_id] = return_val
                result.instruction_counts[agent_id] = 10  # Mock count

            result.total_time_ms = (time.time() - start_time) * 1000
            return result

        # GPU mode placeholder - return mock-style results for now
        for agent_id in agents_to_run:
            result.agent_results[agent_id] = 0
            result.instruction_counts[agent_id] = 0

        result.total_time_ms = (time.time() - start_time) * 1000
        return result
