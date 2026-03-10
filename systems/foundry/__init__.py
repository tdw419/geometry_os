"""
PixelBrain Foundry System

A self-modification system where PixelBrain can inspect, modify, and forge
new logic into its own substrate.

"Let me mutate the WGSL shaders directly based on my visual assessment
of the frame rate. If the 'Code Palace' district is stuttering, let me
'paint' an optimization directly onto the GPU substrate."
"""

from .forge import Forge, ForgeTarget, ForgeOperation
from .shader_forge import ShaderForge
from .geoasm_forge import GeoASMForge
from .safety import SafetyLevel, SafetyChecker

__all__ = [
    'Forge',
    'ForgeTarget',
    'ForgeOperation',
    'ShaderForge',
    'GeoASMForge',
    'SafetyLevel',
    'SafetyChecker',
]
