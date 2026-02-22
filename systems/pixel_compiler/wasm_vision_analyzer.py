"""
WASM Vision Trace Analyzer

Analyzes WASM execution traces visually using pattern detection:
- Trace to heatmap conversion
- PC distribution visualization
- Loop detection
- Control flow graph generation
- Integration with pattern detection pipeline
"""

from dataclasses import dataclass, field
from typing import List, Dict, Tuple, Optional, Any
from collections import Counter, defaultdict
import numpy as np


@dataclass
class LoopInfo:
    """Detected loop information"""
    start_pc: int
    end_pc: int
    iterations: int
    loop_body: List[int]


@dataclass
class ControlFlowNode:
    """Control flow graph node"""
    pc: int
    opcode: int
    incoming: List[int] = field(default_factory=list)
    outgoing: List[int] = field(default_factory=list)


class WasmVisionAnalyzer:
    """
    Analyzes WASM execution traces with visual pattern detection.

    Usage:
        analyzer = WasmVisionAnalyzer()
        events = tracer.events

        # Generate heatmap
        image = analyzer.trace_to_heatmap(events)

        # Detect loops
        loops = analyzer.detect_loops(events)

        # Export visualization
        analyzer.export_heatmap(events, "output.png")
    """

    def __init__(self):
        self.colormap = self._generate_colormap()

    def _generate_colormap(self) -> Dict[int, Tuple[int, int, int]]:
        """Generate color map for opcodes"""
        # Pastel colors for better visualization
        colors = {
            0x41: (255, 200, 200),  # i32.const - pink
            0x6a: (200, 255, 200),  # i32.add - green
            0x6b: (200, 200, 255),  # i32.sub - blue
            0x6c: (255, 255, 200),  # i32.mul - yellow
            0x23: (255, 200, 255),  # global.get - magenta
            0x24: (200, 255, 255),  # global.set - cyan
            0x0b: (150, 150, 150),  # end - gray
        }
        return colors

    def trace_to_heatmap(self, events: List, width: int = 800,
                        height: int = 600) -> np.ndarray:
        """
        Convert trace events to heatmap image.

        Args:
            events: List of trace events
            width: Image width
            height: Image height

        Returns:
            RGB image as numpy array
        """
        # Find PC range
        pc_values = [e.pc for e in events if hasattr(e, 'pc')]
        if not pc_values:
            return np.zeros((height, width, 3), dtype=np.uint8)

        min_pc = min(pc_values)
        max_pc = max(pc_values)
        pc_range = max(max_pc - min_pc, 1)

        # Create heatmap
        heatmap = np.zeros((height, width, 3), dtype=np.uint8)

        # Map PC to x coordinate, time to y coordinate
        for i, event in enumerate(events):
            if not hasattr(event, 'pc'):
                continue

            # Map PC to x
            x = int((event.pc - min_pc) / pc_range * (width - 1))

            # Map time (index) to y
            y = int(i / len(events) * (height - 1))

            # Color by opcode if available
            color = self.colormap.get(
                event.opcode if hasattr(event, 'opcode') else 0,
                (255, 255, 255)
            )

            if 0 <= x < width and 0 <= y < height:
                heatmap[y, x] = color

        return heatmap

    def get_pc_distribution(self, events: List) -> Dict[int, int]:
        """
        Get distribution of execution across PCs.

        Args:
            events: List of trace events

        Returns:
            Dict mapping PC to execution count
        """
        pc_counts = Counter()

        for event in events:
            if hasattr(event, 'pc'):
                pc_counts[event.pc] += 1

        return dict(pc_counts)

    def generate_execution_map(self, events: List, width: int = 256,
                              height: int = 256) -> np.ndarray:
        """
        Generate 2D execution map visualization.

        Args:
            events: List of trace events
            width: Image width
            height: Image height

        Returns:
            RGB image as numpy array
        """
        # Get PC distribution
        distribution = self.get_pc_distribution(events)

        if not distribution:
            return np.zeros((height, width, 3), dtype=np.uint8)

        # Find PC range
        min_pc = min(distribution.keys())
        max_pc = max(distribution.keys())
        pc_range = max(max_pc - min_pc, 1)

        # Create 2D map: x = PC, y = execution count
        max_count = max(distribution.values())

        image = np.zeros((height, width, 3), dtype=np.uint8)

        for pc, count in distribution.items():
            x = int((pc - min_pc) / pc_range * (width - 1))
            y = int((1 - count / max_count) * (height - 1))  # Invert y

            # Color gradient from blue (low) to red (high)
            intensity = int((count / max_count) * 255)
            color = (intensity, 0, 255 - intensity)

            if 0 <= x < width and 0 <= y < height:
                image[y, x] = color

        return image

    def detect_loops(self, events: List, min_iterations: int = 2) -> List[LoopInfo]:
        """
        Detect loops in execution trace.

        Args:
            events: List of trace events
            min_iterations: Minimum iterations to consider a loop

        Returns:
            List of detected LoopInfo objects
        """
        loops = []
        pc_sequence = [e.pc for e in events if hasattr(e, 'pc')]

        # Look for repeated PC patterns
        for i in range(len(pc_sequence)):
            for j in range(i + 1, len(pc_sequence)):
                # Check if PC at position i appears again at j
                if pc_sequence[i] == pc_sequence[j]:
                    # Potential loop from i to j
                    start_pc = pc_sequence[i]
                    # Find the range of PCs in this potential loop
                    loop_body = pc_sequence[i:j]

                    # Count iterations by counting how many times we see this pattern
                    iterations = 1
                    k = j
                    while k < len(pc_sequence):
                        # Check if sequence repeats
                        if k + len(loop_body) <= len(pc_sequence):
                            if pc_sequence[k:k + len(loop_body)] == loop_body:
                                iterations += 1
                                k += len(loop_body)
                            else:
                                break
                        else:
                            break

                    if iterations >= min_iterations:
                        # Found a loop
                        end_pc = max(loop_body) if loop_body else start_pc
                        loops.append(LoopInfo(
                            start_pc=start_pc,
                            end_pc=end_pc,
                            iterations=iterations,
                            loop_body=list(set(loop_body))
                        ))
                    break

        # Remove duplicates
        seen = set()
        unique_loops = []
        for loop in loops:
            key = (loop.start_pc, loop.end_pc)
            if key not in seen:
                seen.add(key)
                unique_loops.append(loop)

        return unique_loops

    def build_control_flow_graph(self, events: List) -> Dict[str, Any]:
        """
        Build control flow graph from trace.

        Args:
            events: List of trace events

        Returns:
            Dict with 'nodes' and 'edges' lists
        """
        nodes = {}
        edges = []

        pc_sequence = [e.pc for e in events if hasattr(e, 'pc')]

        # Create nodes for each unique PC
        for i, pc in enumerate(pc_sequence):
            if pc not in nodes:
                # Find the event for this PC to get opcode
                opcode = 0
                for event in events:
                    if hasattr(event, 'pc') and event.pc == pc:
                        opcode = event.opcode if hasattr(event, 'opcode') else 0
                        break

                nodes[pc] = ControlFlowNode(pc=pc, opcode=opcode)

        # Create edges between consecutive PCs (if not a jump back)
        for i in range(len(pc_sequence) - 1):
            src_pc = pc_sequence[i]
            dst_pc = pc_sequence[i + 1]

            # Add edge if it doesn't exist
            edge_key = (src_pc, dst_pc)
            if edge_key not in [(e.get('from'), e.get('to')) for e in edges]:
                edges.append({
                    'from': src_pc,
                    'to': dst_pc,
                    'type': 'forward' if dst_pc > src_pc else 'back'
                })
                if src_pc in nodes:
                    nodes[src_pc].outgoing.append(dst_pc)
                if dst_pc in nodes:
                    nodes[dst_pc].incoming.append(src_pc)

        return {
            'nodes': [
                {
                    'pc': node.pc,
                    'opcode': node.opcode,
                    'incoming_count': len(node.incoming),
                    'outgoing_count': len(node.outgoing)
                }
                for node in nodes.values()
            ],
            'edges': edges
        }

    def export_heatmap(self, events: List, output_path: str,
                      width: int = 800, height: int = 600):
        """
        Export trace heatmap as PNG file.

        Args:
            events: List of trace events
            output_path: Output file path
            width: Image width
            height: Image height
        """
        from PIL import Image

        image = self.trace_to_heatmap(events, width, height)

        # Convert to PIL Image and save
        img = Image.fromarray(image, 'RGB')
        img.save(output_path)

    def export_execution_map(self, events: List, output_path: str,
                           width: int = 256, height: int = 256):
        """
        Export execution map as PNG file.

        Args:
            events: List of trace events
            output_path: Output file path
            width: Image width
            height: Image height
        """
        from PIL import Image

        image = self.generate_execution_map(events, width, height)
        img = Image.fromarray(image, 'RGB')
        img.save(output_path)

    def analyze_patterns(self, events: List) -> Dict[str, Any]:
        """
        Perform complete pattern analysis on trace.

        Args:
            events: List of trace events

        Returns:
            Dict with analysis results
        """
        return {
            'pc_distribution': self.get_pc_distribution(events),
            'loops': self.detect_loops(events),
            'control_flow': self.build_control_flow_graph(events),
            'total_events': len(events),
            'unique_pcs': len(self.get_pc_distribution(events))
        }
