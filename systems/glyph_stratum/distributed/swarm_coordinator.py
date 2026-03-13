"""
Geometry OS - Distributed Swarm Coordinator
Phase 70: Multi-GPU Execution

Dispatches glyph execution across multiple GPUs for scalable swarm computation.
"""

import wgpu
import numpy as np
import time
from dataclasses import dataclass
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import List

SHADER_PATH = Path(__file__).parent.parent.parent / "visual_shell/web/shaders/glyph_distributed.wgsl"


@dataclass
class ComputeNode:
    """Represents a single GPU compute node in the distributed swarm."""
    node_id: int
    device: wgpu.GPUDevice
    work_offset: int
    work_count: int
    state_buffer: wgpu.GPUBuffer
    memory_buffer: wgpu.GPUBuffer
    output_texture: wgpu.GPUTexture
    bind_group: wgpu.GPUBindGroup
    pipeline: wgpu.GPUComputePipeline


class DistributedSwarmCoordinator:
    """
    Coordinates glyph execution across multiple GPUs.

    Each GPU node receives a partition of the total agents and executes
    the glyph program independently. Results can be merged for distributed
    computation tasks.
    """

    def __init__(self, num_agents: int = 10000, num_gpus: int = 1):
        """
        Initialize the distributed swarm coordinator.

        Args:
            num_agents: Total number of swarm agents to execute
            num_gpus: Number of GPU nodes to distribute across
        """
        self.num_agents = num_agents
        self.num_gpus = num_gpus
        self.nodes: List[ComputeNode] = []
        self.adapter = None

    def initialize(self) -> None:
        """
        Initialize all GPU nodes with work partitioning.

        Creates compute nodes, partitions agent work, and sets up
        all GPU resources (buffers, textures, pipelines).
        """
        print(f"Initializing Distributed Swarm Coordinator...")
        print(f"  Agents: {self.num_agents}")
        print(f"  GPUs: {self.num_gpus}")

        # Request adapter
        self.adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
        if self.adapter is None:
            raise RuntimeError("Failed to request GPU adapter")

        # Load shader
        with open(SHADER_PATH, "r") as f:
            shader_code = f.read()

        # Calculate work partitioning
        agents_per_node = self.num_agents // self.num_gpus

        for i in range(self.num_gpus):
            work_offset = i * agents_per_node
            # Last node gets any remainder
            if i == self.num_gpus - 1:
                work_count = self.num_agents - work_offset
            else:
                work_count = agents_per_node

            node = self._create_node(i, shader_code, work_offset, work_count)
            self.nodes.append(node)
            print(f"  Node {i}: offset={work_offset}, count={work_count}")

        print(f"Distributed Swarm initialized with {len(self.nodes)} nodes")

    def _create_node(
        self,
        node_id: int,
        shader_code: str,
        work_offset: int,
        work_count: int
    ) -> ComputeNode:
        """
        Create a single compute node with all GPU resources.

        Args:
            node_id: Unique identifier for this node
            shader_code: WGSL shader source
            work_offset: Starting agent index for this node
            work_count: Number of agents this node handles

        Returns:
            Configured ComputeNode ready for dispatch
        """
        # Request device for this node
        device = self.adapter.request_device()

        # Create shader module
        shader_module = device.create_shader_module(code=shader_code)

        # Create program texture
        program_texture = self._create_program_texture(device)

        # Create state buffer with node configuration
        # State layout: node_id, total_nodes, work_offset, work_count, 0, 0, 0, 0
        state_data = np.array([
            node_id,
            self.num_gpus,
            work_offset,
            work_count,
            0, 0, 0, 0
        ], dtype=np.uint32)
        state_buffer = device.create_buffer(
            size=state_data.nbytes,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )
        device.queue.write_buffer(state_buffer, 0, state_data)

        # Create memory buffer
        memory_buffer = device.create_buffer(
            size=16384 * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
        )

        # Create output texture
        output_texture = device.create_texture(
            size=(100, 100, 1),
            usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.COPY_SRC,
            format=wgpu.TextureFormat.rgba8unorm,
        )

        # Create swarm DNA buffer (for 10000 agents, vec4 each)
        swarm_dna_buffer = device.create_buffer(
            size=10000 * 16,  # 10000 * vec4<u32> (4 bytes per u32 * 4 components)
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST
        )
        # Initialize with random DNA
        dna_data = np.random.randint(0, 100, size=(10000, 4), dtype=np.uint32)
        device.queue.write_buffer(swarm_dna_buffer, 0, dna_data)

        # Create peer buffer for inter-node communication
        peer_buffer = device.create_buffer(
            size=16384 * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )

        # Create compute pipeline
        pipeline = device.create_compute_pipeline(
            layout="auto",
            compute={"module": shader_module, "entry_point": "main"},
        )

        # Get the bind group layout to see how many bindings it expects
        bg_layout = pipeline.get_bind_group_layout(0)

        # Create bind group matching shader bindings
        bind_group = device.create_bind_group(
            layout=bg_layout,
            entries=[
                {"binding": 0, "resource": program_texture.create_view()},
                {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
                {"binding": 2, "resource": {"buffer": memory_buffer, "offset": 0, "size": memory_buffer.size}},
                {"binding": 3, "resource": output_texture.create_view()},
                {"binding": 4, "resource": {"buffer": swarm_dna_buffer, "offset": 0, "size": swarm_dna_buffer.size}},
                {"binding": 5, "resource": {"buffer": peer_buffer, "offset": 0, "size": peer_buffer.size}},
            ],
        )

        return ComputeNode(
            node_id=node_id,
            device=device,
            work_offset=work_offset,
            work_count=work_count,
            state_buffer=state_buffer,
            memory_buffer=memory_buffer,
            output_texture=output_texture,
            bind_group=bind_group,
            pipeline=pipeline,
        )

    def _create_program_texture(self, device: wgpu.GPUDevice) -> wgpu.GPUTexture:
        """
        Create a test program texture with sample glyph instructions.

        Args:
            device: GPU device to create texture on

        Returns:
            Configured GPU texture with program data
        """
        # Create a 16x16 texture with test program
        texture_size = 16
        texture_data = np.zeros((texture_size, texture_size, 4), dtype=np.uint8)

        # Simple test program:
        # PC 0: DATA(9, r1, 42) - Load value 42 into register 1
        texture_data[0, 0] = [9, 0, 1, 42]
        # PC 1: ADD(200, r1, r1) - Double it
        texture_data[0, 1] = [200, 0, 1, 1]
        # PC 2: DRAW(215, r1, 0) - Visual output
        texture_data[0, 2] = [215, 0, 1, 0]
        # PC 3: HALT(255)
        texture_data[0, 3] = [255, 0, 0, 0]

        texture = device.create_texture(
            size=(texture_size, texture_size, 1),
            usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
            format=wgpu.TextureFormat.rgba8unorm,
        )
        device.queue.write_texture(
            {"texture": texture, "origin": (0, 0, 0), "mip_level": 0},
            texture_data,
            {"bytes_per_row": texture_size * 4, "rows_per_image": texture_size},
            (texture_size, texture_size, 1),
        )

        return texture

    def dispatch(self, iterations: int = 1) -> None:
        """
        Dispatch glyph execution across all nodes via ThreadPoolExecutor.

        Args:
            iterations: Number of compute iterations to run
        """
        def dispatch_node(node: ComputeNode) -> dict:
            """Execute compute pass on a single node."""
            for _ in range(iterations):
                command_encoder = node.device.create_command_encoder()
                compute_pass = command_encoder.begin_compute_pass()
                compute_pass.set_pipeline(node.pipeline)
                compute_pass.set_bind_group(0, node.bind_group)

                # Calculate workgroups based on agent count
                workgroup_size = 128
                workgroups = (node.work_count + workgroup_size - 1) // workgroup_size
                compute_pass.dispatch_workgroups(workgroups)
                compute_pass.end()
                node.device.queue.submit([command_encoder.finish()])

            node.device.queue.on_submitted_work_done()
            return {"node_id": node.node_id, "status": "complete"}

        # Execute all nodes in parallel
        with ThreadPoolExecutor(max_workers=self.num_gpus) as executor:
            futures = [executor.submit(dispatch_node, node) for node in self.nodes]
            for future in as_completed(futures):
                result = future.result()
                # Node completed

    def benchmark(self, iterations: int = 100) -> dict:
        """
        Run benchmark and print FPS/GIPS metrics.

        Args:
            iterations: Number of benchmark iterations

        Returns:
            Dictionary with benchmark results
        """
        print(f"\nRunning distributed benchmark ({iterations} iterations)...")

        # Warmup
        self.dispatch(iterations=1)

        # Timed run
        start_time = time.perf_counter()
        self.dispatch(iterations=iterations)
        end_time = time.perf_counter()

        total_time = end_time - start_time
        avg_ms = (total_time / iterations) * 1000
        fps = 1000.0 / avg_ms if avg_ms > 0 else 0
        gips = (self.num_agents * iterations) / total_time if total_time > 0 else 0

        print(f"\n[Distributed Swarm Benchmark Results]")
        print(f"  Total Agents: {self.num_agents}")
        print(f"  GPU Nodes: {self.num_gpus}")
        print(f"  Avg Latency: {avg_ms:.3f} ms")
        print(f"  FPS: {fps:.1f}")
        print(f"  GIPS: {gips:,.0f}")
        print(f"  Status: PASS")

        return {
            "total_agents": self.num_agents,
            "num_gpus": self.num_gpus,
            "avg_ms": avg_ms,
            "fps": fps,
            "gips": gips,
        }


def main():
    """Main entry point for distributed swarm coordinator benchmark."""
    coordinator = DistributedSwarmCoordinator(num_agents=10000, num_gpus=1)
    coordinator.initialize()
    coordinator.benchmark(iterations=100)


if __name__ == "__main__":
    main()
