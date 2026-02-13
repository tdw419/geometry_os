"""
Pixel Compiler - PixelRTS Visual Debugger and Runtime
"""

from .pixelrts_trace import GPUExecutor, TraceVisualizer, main

# Base exports always available
_base_exports = [
    'GPUExecutor',
    'TraceVisualizer',
    'main',
]

try:
    from .wasm_gpu_bridge import WASMGPUBridge, ExecutionResult
    _base_exports.extend([
        'WASMGPUBridge',
        'ExecutionResult',
    ])
except ImportError:
    pass

# Pixel-Native GUI exports
try:
    from systems.pixel_compiler.pixel_native_types import (
        RuntimeConfig,
        GUIState,
        InputEvent,
        ClickEvent,
        KeyEvent,
        DragEvent,
        TypeEvent,
        WidgetInfo,
        WidgetType,
    )
    from systems.pixel_compiler.virtual_framebuffer import VirtualFramebuffer
    from systems.pixel_compiler.pixel_native_runtime import PixelNativeRuntime
    from systems.pixel_compiler.input_injector import InputInjector
    from systems.pixel_compiler.feedback_loop import FeedbackLoop
    from systems.pixel_compiler.ai_vision_layer import AIVisionLayer
    from systems.pixel_compiler.pixel_native_gui import PixelNativeGUI

    _base_exports.extend([
        # Pixel-Native GUI
        "RuntimeConfig",
        "GUIState",
        "InputEvent",
        "ClickEvent",
        "KeyEvent",
        "DragEvent",
        "TypeEvent",
        "WidgetInfo",
        "WidgetType",
        "VirtualFramebuffer",
        "PixelNativeRuntime",
        "InputInjector",
        "FeedbackLoop",
        "AIVisionLayer",
        "PixelNativeGUI",
    ])
except ImportError:
    pass

__all__ = _base_exports
