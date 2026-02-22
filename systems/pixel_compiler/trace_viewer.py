"""
Trace Viewer - PixelRTS Visual Debugger

Provides visualization components for execution traces from the Pixel VM.
Trace entries capture program counter, opcode, and operands during execution.
"""

import json
import numpy as np
from dataclasses import dataclass, asdict
from typing import List, Tuple, Dict, Optional, Any
from pathlib import Path
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.figure import Figure


@dataclass
class TraceEntry:
    """
    A single trace entry from Pixel VM execution.

    Attributes:
        pc: Program counter (instruction address)
        opcode: Operation code (instruction identifier)
        dest: Destination register
        src: Source register
        immediate: Immediate value
    """
    pc: int
    opcode: int
    dest: int
    src: int
    immediate: int

    # Opcodes matching pixel_vm_debug.wgsl
    OPCODES = {
        0x00: 'NOP',
        0x0A: 'LOAD',   # OP_LOAD
        0x0B: 'MOV',    # OP_MOV
        0x64: 'ADD',    # OP_ADD
        0x65: 'SUB',
        0x66: 'MUL',    # OP_MUL
        0x67: 'DIV',
        0xD3: 'RET',    # OP_RET
    }

    @property
    def opcode_name(self) -> str:
        """Return the mnemonic name for this opcode"""
        return self.OPCODES.get(self.opcode, f'UNKNOWN_0x{self.opcode:02X}')

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization"""
        return {
            'pc': self.pc,
            'opcode': self.opcode,
            'opcode_name': self.opcode_name,
            'dest': self.dest,
            'src': self.src,
            'immediate': self.immediate,
        }


class TraceVisualizer:
    """
    Visualizes execution traces from Pixel VM.

    Features:
    - Heatmap generation showing execution frequency per instruction
    - Timeline visualization of PC and opcode evolution
    - JSON export/import for trace persistence
    - Animation creation for step-by-step execution visualization
    """

    def __init__(self, trace: List[TraceEntry], grid_size: int = 32):
        """
        Initialize the visualizer.

        Args:
            trace: List of trace entries from execution
            grid_size: Size of the instruction grid (default 32x32)
        """
        self.trace = trace
        self.grid_size = grid_size

    @classmethod
    def from_trace_buffer(cls, trace_buffer: np.ndarray, grid_size: int = 32) -> 'TraceVisualizer':
        """
        Create visualizer from raw trace buffer (WGSL format).

        The trace buffer format is: [pc, opcode, dest, src, immediate, ...]

        Args:
            trace_buffer: Flattened trace buffer array
            grid_size: Size of the instruction grid

        Returns:
            TraceVisualizer instance
        """
        # Ensure buffer length is multiple of 5
        if len(trace_buffer) % 5 != 0:
            trace_buffer = trace_buffer[: (len(trace_buffer) // 5) * 5]

        trace = []
        for i in range(0, len(trace_buffer), 5):
            entry = TraceEntry(
                pc=int(trace_buffer[i]),
                opcode=int(trace_buffer[i + 1]),
                dest=int(trace_buffer[i + 2]),
                src=int(trace_buffer[i + 3]),
                immediate=int(trace_buffer[i + 4]),
            )
            trace.append(entry)

        return cls(trace, grid_size)

    def render_heatmap(self) -> np.ndarray:
        """
        Render execution heatmap as 2D array.

        Returns:
            2D numpy array where each cell contains execution count
        """
        heatmap = np.zeros((self.grid_size, self.grid_size), dtype=np.int32)

        for entry in self.trace:
            row = entry.pc // self.grid_size
            col = entry.pc % self.grid_size

            # Bounds check
            if 0 <= row < self.grid_size and 0 <= col < self.grid_size:
                heatmap[row, col] += 1

        return heatmap

    def plot_heatmap(self, title: str = "Execution Heatmap") -> Figure:
        """
        Create matplotlib figure of the execution heatmap.

        Args:
            title: Figure title

        Returns:
            matplotlib Figure object
        """
        heatmap = self.render_heatmap()

        fig, ax = plt.subplots(figsize=(10, 8))
        im = ax.imshow(heatmap, cmap='hot', interpolation='nearest')
        ax.set_title(title)
        ax.set_xlabel('Column (PC % grid_size)')
        ax.set_ylabel('Row (PC // grid_size)')
        fig.colorbar(im, ax=ax, label='Execution Count')

        return fig

    def render_timeline(self) -> np.ndarray:
        """
        Render timeline as 2D array.

        Returns:
            2D array where row 0 is PC over time, row 1 is opcode over time
        """
        if not self.trace:
            return np.zeros((2, 0), dtype=np.int32)

        timeline = np.zeros((2, len(self.trace)), dtype=np.int32)
        for i, entry in enumerate(self.trace):
            timeline[0, i] = entry.pc
            timeline[1, i] = entry.opcode

        return timeline

    def plot_timeline(self, title: str = "Execution Timeline") -> Figure:
        """
        Create matplotlib figure of the execution timeline.

        Args:
            title: Figure title

        Returns:
            matplotlib Figure object
        """
        timeline = self.render_timeline()

        if timeline.shape[1] == 0:
            fig, ax = plt.subplots(figsize=(10, 4))
            ax.text(0.5, 0.5, 'No trace data', ha='center', va='center')
            ax.set_title(title)
            return fig

        fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 6), sharex=True)

        # Plot PC over time
        ax1.plot(timeline[0], 'b-', linewidth=0.5)
        ax1.set_ylabel('Program Counter')
        ax1.set_title(title)
        ax1.grid(True, alpha=0.3)

        # Plot opcode over time
        ax2.plot(timeline[1], 'r-', linewidth=0.5)
        ax2.set_xlabel('Execution Step')
        ax2.set_ylabel('Opcode')
        ax2.grid(True, alpha=0.3)

        # Add opcode labels for known opcodes
        opcode_labels = {v: k for k, v in TraceEntry.OPCODES.items()}
        ax2.set_yticks(list(opcode_labels.values()))
        ax2.set_yticklabels(list(opcode_labels.keys()))

        plt.tight_layout()
        return fig

    def export_json(self, filepath: str | Path) -> None:
        """
        Export trace to JSON file.

        Args:
            filepath: Path to output JSON file
        """
        filepath = Path(filepath)
        data = {
            'grid_size': self.grid_size,
            'trace_length': len(self.trace),
            'trace': [entry.to_dict() for entry in self.trace],
        }

        with open(filepath, 'w') as f:
            json.dump(data, f, indent=2)

    @classmethod
    def load_json(cls, filepath: str | Path) -> 'TraceVisualizer':
        """
        Load trace from JSON file.

        Args:
            filepath: Path to input JSON file

        Returns:
            TraceVisualizer instance
        """
        filepath = Path(filepath)

        with open(filepath, 'r') as f:
            data = json.load(f)

        trace = []
        for entry_data in data['trace']:
            entry = TraceEntry(
                pc=entry_data['pc'],
                opcode=entry_data['opcode'],
                dest=entry_data['dest'],
                src=entry_data['src'],
                immediate=entry_data['immediate'],
            )
            trace.append(entry)

        return cls(trace, grid_size=data['grid_size'])

    def create_animation(
        self,
        interval: int = 50,
        frame_skip: int = 1,
        title: str = "Execution Animation"
    ) -> animation.FuncAnimation:
        """
        Create matplotlib animation of trace execution.

        Args:
            interval: Delay between frames in milliseconds
            frame_skip: Number of trace steps to skip per frame
            title: Animation title

        Returns:
            matplotlib FuncAnimation object
        """
        # Subsample trace for animation
        frames = list(range(0, len(self.trace), frame_skip))

        fig, (ax_heat, ax_time) = plt.subplots(1, 2, figsize=(14, 6))

        # Initialize heatmap
        heatmap = np.zeros((self.grid_size, self.grid_size), dtype=np.int32)
        im_heat = ax_heat.imshow(heatmap, cmap='hot', interpolation='nearest',
                                  vmin=0, vmax=max(1, len(frames)))
        ax_heat.set_title(f'{title} - Heatmap')
        ax_heat.set_xlabel('Column')
        ax_heat.set_ylabel('Row')
        fig.colorbar(im_heat, ax=ax_heat, label='Execution Count')

        # Initialize timeline
        pcs = []
        opcodes = []
        line_pc, = ax_time.plot([], [], 'b-', linewidth=0.5, label='PC')
        ax_time.set_xlabel('Step')
        ax_time.set_ylabel('Program Counter')
        ax_time.set_title(f'{title} - PC Timeline')
        ax_time.grid(True, alpha=0.3)
        ax_time.legend()

        def update(frame_idx: int):
            entry = self.trace[frame_idx]

            # Update heatmap
            row = entry.pc // self.grid_size
            col = entry.pc % self.grid_size
            if 0 <= row < self.grid_size and 0 <= col < self.grid_size:
                heatmap[row, col] += 1
            im_heat.set_data(heatmap)
            im_heat.set_clim(vmin=0, vmax=np.max(heatmap))

            # Update timeline
            pcs.append(entry.pc)
            line_pc.set_data(range(len(pcs)), pcs)
            ax_time.set_xlim(0, max(10, len(pcs)))
            ax_time.set_ylim(0, max(1, max(pcs) * 1.1))

            return [im_heat, line_pc]

        anim = animation.FuncAnimation(
            fig, update, frames=frames, interval=interval, blit=True
        )

        return anim

    def instruction_counts(self) -> Dict[str, int]:
        """
        Count occurrences of each instruction type.

        Returns:
            Dictionary mapping opcode names to counts
        """
        counts: Dict[str, int] = {}
        for entry in self.trace:
            name = entry.opcode_name
            counts[name] = counts.get(name, 0) + 1
        return counts

    def execution_coverage(self) -> float:
        """
        Calculate what fraction of possible instructions were executed.

        Returns:
            Coverage ratio from 0.0 to 1.0
        """
        unique_pcs = set(entry.pc for entry in self.trace)
        total_possible = self.grid_size * self.grid_size
        return len(unique_pcs) / total_possible if total_possible > 0 else 0.0

    def hotspots(self, top_n: int = 10) -> List[Tuple[int, int]]:
        """
        Find most frequently executed program locations.

        Args:
            top_n: Number of hotspots to return

        Returns:
            List of (pc, count) tuples sorted by count descending
        """
        pc_counts: Dict[int, int] = {}
        for entry in self.trace:
            pc_counts[entry.pc] = pc_counts.get(entry.pc, 0) + 1

        return sorted(pc_counts.items(), key=lambda x: x[1], reverse=True)[:top_n]
