# systems/pixel_compiler/pixel_native_gui.py
"""
PixelNativeGUI - Main facade for AI-GUI interaction.

Provides a simple API for AI agents to perceive and interact with GUIs.
"""
import numpy as np
from typing import Optional, Tuple, Any, List

from systems.pixel_compiler.pixel_native_types import (
    RuntimeConfig,
    ClickEvent,
    KeyEvent,
    DragEvent,
    GUIState
)
from systems.pixel_compiler.pixel_native_runtime import PixelNativeRuntime
from systems.pixel_compiler.virtual_framebuffer import VirtualFramebuffer
from systems.pixel_compiler.input_injector import InputInjector
from systems.pixel_compiler.feedback_loop import FeedbackLoop
from systems.pixel_compiler.ai_vision_layer import AIVisionLayer


class PixelNativeGUI:
    """
    Main API for AI-GUI interaction.

    Usage:
        gui = PixelNativeGUI(program="calculator.rts.png")

        # AI perceives
        state = gui.perceive()
        coords = gui.find_widget("Save")

        # AI acts
        gui.click(*coords)
        gui.type_text("Hello")

        # AI verifies
        success = gui.wait_for_change()
    """

    def __init__(self, width: int = 1920, height: int = 1920,
                 mode: str = "virtual", vlm_model: str = "mock",
                 program: Optional[str] = None,
                 use_gpu: bool = True):
        """
        Initialize pixel-native GUI.

        Args:
            width: Screen width
            height: Screen height
            mode: "virtual" or "physical"
            vlm_model: Vision model name ("mock", "llava:7b", etc.)
            program: Optional PixelRTS program to load
            use_gpu: Whether to use GPU acceleration (default: True)
        """
        self.width = width
        self.height = height
        self.mode = mode
        self.use_gpu = use_gpu

        # Create configuration
        self._config = RuntimeConfig(
            width=width,
            height=height,
            mode=mode,
            vlm_model=vlm_model
        )

        # Initialize components
        self._framebuffer = VirtualFramebuffer(width, height)
        self._runtime = PixelNativeRuntime(self._config, use_gpu=use_gpu)
        self._injector = InputInjector(mode="gpu", bounds=(width, height))
        self._vision = AIVisionLayer(model=vlm_model)
        self._feedback = FeedbackLoop(self._framebuffer)

        # Initialize runtime
        self._runtime.initialize()

        # Load program if provided
        if program:
            self.load_program(program)

    def load_program(self, path: str) -> None:
        """Load a PixelRTS program."""
        # In real implementation, would decode .rts.png and load into GPU
        pass

    def perceive(self) -> GUIState:
        """Perceive current GUI state."""
        return self._vision.perceive(self._framebuffer.pixels)

    def find_widget(self, description: str) -> Optional[Tuple[int, int]]:
        """Find widget by description and return center coordinates."""
        return self._vision.ground_intent(description, self._framebuffer.pixels)

    def click(self, x: int, y: int, button: int = 1) -> None:
        """Click at coordinates."""
        event = ClickEvent(x=x, y=y, button=button)
        self._runtime.inject_input(event)

    def type_text(self, text: str) -> None:
        """Type text."""
        self._injector.type_text(text)
        # Note: Events remain in injector until execute_frame() is called
        # This allows inspection of pending events via get_pending_events()

    def key_press(self, key: str, modifiers: list = None) -> None:
        """Press key with modifiers."""
        event = KeyEvent(key=key, modifiers=modifiers or [])
        self._runtime.inject_input(event)

    def drag(self, x1: int, y1: int, x2: int, y2: int) -> None:
        """Drag from (x1,y1) to (x2,y2)."""
        self._injector.drag(x1, y1, x2, y2)
        self._injector.flush()

    def execute_frame(self) -> None:
        """Execute one frame."""
        # Flush injector events to runtime before executing
        for event in self._injector.flush():
            # Convert to runtime input format
            pass  # TODO: Convert InjectedEvent to InputEvent
        self._runtime.execute_frame()

    def wait_for_change(self, timeout_ms: int = 1000) -> bool:
        """Wait for visual change.

        Note: If capture_before() was already called externally, this will
        use that snapshot. Otherwise, it captures before starting to wait.
        """
        # Only capture before if not already captured
        if self._feedback.before_snapshot is None:
            self._feedback.capture_before()
        return self._feedback.wait_for_change(timeout_ms)

    def get_pixels(self) -> np.ndarray:
        """Get current framebuffer pixels."""
        return self._framebuffer.pixels.copy()

    def get_pixel(self, x: int, y: int) -> Tuple[int, int, int, int]:
        """Get single pixel color."""
        return tuple(self._framebuffer.pixels[y, x])

    def shutdown(self) -> None:
        """Release resources."""
        self._runtime.shutdown()

    def __enter__(self):
        return self

    def __exit__(self, *args):
        self.shutdown()
