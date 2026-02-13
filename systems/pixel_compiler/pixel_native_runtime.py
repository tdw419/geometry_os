# systems/pixel_compiler/pixel_native_runtime.py
"""
Pixel-Native GUI Runtime.

Orchestrates GPU execution of GUI programs with AI perception.
"""
import numpy as np
from typing import List, Optional
from dataclasses import dataclass, field

from systems.pixel_compiler.pixel_native_types import (
    RuntimeConfig,
    InputEvent,
    GUIState
)
from systems.pixel_compiler.virtual_framebuffer import VirtualFramebuffer


class PixelNativeRuntime:
    """
    Main runtime for pixel-native GUI execution.

    In virtual mode: GUI renders to in-memory framebuffer
    In physical mode: GUI renders to /dev/fb0
    """

    def __init__(self, config: Optional[RuntimeConfig] = None):
        self.config = config or RuntimeConfig()

        # Virtual framebuffer (for virtual mode)
        self._framebuffer = VirtualFramebuffer(
            self.config.width,
            self.config.height
        )

        # Input queue
        self.pending_inputs: List[InputEvent] = []

        # State
        self.frame_count: int = 0
        self._running: bool = False

        # GPU resources (mock for now)
        self._gpu_initialized: bool = False
        self._state_texture: Optional[np.ndarray] = None

    def initialize(self) -> bool:
        """Initialize GPU resources."""
        # For now, just allocate state texture
        self._state_texture = np.zeros(
            (self.config.height, self.config.width, 4),
            dtype=np.float32
        )
        self._gpu_initialized = True
        return True

    def get_framebuffer(self) -> np.ndarray:
        """Get current framebuffer pixels (zero-copy view)."""
        return self._framebuffer.pixels

    def get_framebuffer_copy(self) -> np.ndarray:
        """Get a copy of framebuffer pixels."""
        return self._framebuffer.pixels.copy()

    def execute_frame(self) -> None:
        """Execute one frame: process inputs + update state + render."""
        if not self._gpu_initialized:
            self.initialize()

        # Process pending inputs
        self.process_inputs()

        # Update state (mock - just increment frame)
        self.frame_count += 1

        # Render (mock - just clear for now)
        # In real implementation, this would run WGSL shaders

    def process_inputs(self) -> None:
        """Process all pending input events."""
        for event in self.pending_inputs:
            self._handle_input(event)
        self.pending_inputs.clear()

    def _handle_input(self, event: InputEvent) -> None:
        """Handle a single input event."""
        # In real implementation, this would write to GPU input buffer
        # and trigger state updates
        pass

    def inject_input(self, event: InputEvent) -> None:
        """Add an input event to the queue."""
        self.pending_inputs.append(event)

    def get_state(self) -> GUIState:
        """Get current GUI state."""
        # In real implementation, this would parse state texture
        return GUIState()

    def shutdown(self) -> None:
        """Release GPU resources."""
        self._gpu_initialized = False
        self._state_texture = None
