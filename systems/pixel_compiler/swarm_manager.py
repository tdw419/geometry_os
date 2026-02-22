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

    @classmethod
    def from_wasm(cls, wasm_bytes: bytes, shader_path: str = None) -> 'SwarmManager':
        """
        Create SwarmManager pre-loaded with WASM bytecode.

        This factory method creates a SwarmManager instance and immediately
        loads the provided WASM bytecode, making it ready for agent spawning
        without requiring a separate load_bytecode() call.

        Args:
            wasm_bytes: WASM bytecode to upload
            shader_path: Optional custom shader path

        Returns:
            SwarmManager ready for agent spawning

        Example:
            >>> wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])
            >>> manager = SwarmManager.from_wasm(wasm)
            >>> agent_id = manager.spawn_agent()  # No need to call load_bytecode first
        """
        manager = cls(shader_path)
        manager.load_bytecode(wasm_bytes)
        return manager

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
        """Create compute pipeline from swarm shader."""
        from pathlib import Path

        if not Path(shader_path).exists():
            self._shader_path = shader_path
            return

        with open(shader_path, 'r') as f:
            shader_source = f.read()

        shader_module = self.device.create_shader_module(code=shader_source)

        bg_layout_entries = [
            {"binding": i, "visibility": wgpu.ShaderStage.COMPUTE,
             "buffer": {"type": wgpu.BufferBindingType.read_only_storage if i == 0 else wgpu.BufferBindingType.storage if i < 4 else wgpu.BufferBindingType.uniform}}
            for i in range(5)
        ]

        bg_layout = self.device.create_bind_group_layout(entries=bg_layout_entries)
        pipeline_layout = self.device.create_pipeline_layout(bind_group_layouts=[bg_layout])

        self.pipeline = self.device.create_compute_pipeline(
            layout=pipeline_layout,
            compute={"module": shader_module, "entry_point": "main"}
        )
        self._bind_group_layout = bg_layout

    def _create_bind_group(self):
        """Create bind group for dispatch."""
        entries = [
            {"binding": 0, "resource": {"buffer": self.bytecode_buffer, "offset": 0, "size": self.bytecode_buffer.size}},
            {"binding": 1, "resource": {"buffer": self.pool_buffer, "offset": 0, "size": self.pool_buffer.size}},
            {"binding": 2, "resource": {"buffer": self.globals_buffer, "offset": 0, "size": self.globals_buffer.size}},
            {"binding": 3, "resource": {"buffer": self.output_buffer, "offset": 0, "size": self.output_buffer.size}},
            {"binding": 4, "resource": {"buffer": self.config_buffer, "offset": 0, "size": self.config_buffer.size}},
        ]
        return self.device.create_bind_group(layout=self._bind_group_layout, entries=entries)

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

        # GPU mode
        entry_point = self.active_agents[agents_to_run[0]].entry_point

        config_data = np.array([
            self._bytecode_size,
            active_count,
            entry_point,
            max_instructions,
            0, 0, 0, 0
        ], dtype=np.uint32)

        self.device.queue.write_buffer(self.config_buffer, 0, config_data.tobytes())

        # Sync globals if dirty
        if hasattr(self, '_globals_dirty') and self._globals_dirty:
            self.device.queue.write_buffer(self.globals_buffer, 0, self._mock_globals.tobytes())
            self._globals_dirty = False

        # Create bind group and dispatch
        bind_group = self._create_bind_group()

        command_encoder = self.device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(self.pipeline)
        compute_pass.set_bind_group(0, bind_group, [], 0, 99)
        compute_pass.dispatch_workgroups(active_count, 1, 1)
        compute_pass.end()

        self.device.queue.submit([command_encoder.finish()])

        # Read results
        output_data = self.device.queue.read_buffer(self.output_buffer).tobytes()
        output_array = np.frombuffer(output_data, dtype=np.uint32)

        for agent_id in agents_to_run:
            slot = self.active_agents[agent_id].pool_slot
            result.agent_results[agent_id] = int(output_array[slot])
            result.instruction_counts[agent_id] = max_instructions

        result.total_time_ms = (time.time() - start_time) * 1000
        return result
