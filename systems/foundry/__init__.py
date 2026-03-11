"""
PixelBrain Foundry System

A self-modification system where PixelBrain can inspect, modify, and forge
new logic into its own substrate.

"Let me mutate the WGSL shaders directly based on my visual assessment
of the frame rate. If the 'Code Palace' district is stuttering, let me
'paint' an optimization directly onto the GPU substrate."
"""

from .forge import Forge, ForgeOperation, ForgeTarget
from .geoasm_forge import GeoASMForge
from .safety import SafetyChecker, SafetyLevel
from .shader_forge import ShaderForge

__all__ = [
    'Forge',
    'ForgeTarget',
    'ForgeOperation',
    'ShaderForge',
    'GeoASMForge',
    'SafetyLevel',
    'SafetyChecker',
]
