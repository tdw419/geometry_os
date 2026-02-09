"""
Pixel Compiler - PixelRTS Visual Debugger and Runtime
"""

from .pixelrts_trace import GPUExecutor, TraceVisualizer, main
try:
    from .wasm_gpu_bridge import WASMGPUBridge, ExecutionResult
    __all__ = [
        'GPUExecutor',
        'TraceVisualizer',
        'main',
        'WASMGPUBridge',
        'ExecutionResult',
    ]
except ImportError:
    __all__ = [
        'GPUExecutor',
        'TraceVisualizer',
        'main',
    ]
