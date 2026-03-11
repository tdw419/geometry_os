#!/usr/bin/env python3
"""
Kernel Registry

Manages multiple kernel instances and provides hot-swapping capabilities.
"""

import time
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Any, Dict, List, Optional

from .unified_neural_kernel import KernelType, NeuralKernelInterface


class KernelStatus(Enum):
    """Status of a kernel in the registry."""
    ACTIVE = auto()
    STANDBY = auto()
    MAINTENANCE = auto()
    OFFLINE = auto()


@dataclass
class KernelEntry:
    """Entry in the kernel registry."""
    name: str
    kernel: NeuralKernelInterface
    kernel_type: KernelType
    status: KernelStatus = KernelStatus.STANDBY
    registered_at: float = field(default_factory=time.time)

    @property
    def is_healthy(self) -> bool:
        """Check if kernel is in a healthy state."""
        return self.status in [KernelStatus.ACTIVE, KernelStatus.STANDBY]


@dataclass
class RegistryMetrics:
    """Metrics for the kernel registry."""
    total_kernels: int = 0
    active_name: Optional[str] = None
    swap_count: int = 0


class KernelRegistry:
    """
    Central registry for Geometry OS kernels.
    Supports hot-swapping and health monitoring.
    """

    def __init__(self):
        self.kernels: Dict[str, KernelEntry] = {}
        self._kernels: Dict[str, KernelEntry] = self.kernels
        self.active_kernel_name: Optional[str] = None
        self.metrics = RegistryMetrics()

    def register(
        self,
        name: str,
        kernel: NeuralKernelInterface,
        kernel_type: KernelType,
        make_active: bool = False
    ):
        """Register a new kernel instance."""
        entry = KernelEntry(name, kernel, kernel_type)
        self.kernels[name] = entry
        self.metrics.total_kernels = len(self.kernels)
        
        if make_active or self.active_kernel_name is None:
            self.activate(name)

    def activate(self, name: str):
        """Switch to the specified kernel."""
        if name not in self.kernels:
            return False
            
        if self.active_kernel_name:
            self.kernels[self.active_kernel_name].status = KernelStatus.STANDBY
            self.metrics.swap_count += 1
            
        self.active_kernel_name = name
        self.kernels[name].status = KernelStatus.ACTIVE
        self.metrics.active_name = name
        return True

    def get_active(self) -> Optional[NeuralKernelInterface]:
        """Get the currently active kernel."""
        if not self.active_kernel_name:
            return None
        return self.kernels[self.active_kernel_name].kernel

    def get_active_name(self) -> Optional[str]:
        """Get the name of the currently active kernel."""
        return self.active_kernel_name

    def swap(self, name: str) -> bool:
        """Hot-swap to a different kernel."""
        return self.activate(name)

    def list_kernels(self) -> List[Dict[str, Any]]:
        """List all kernels in the registry."""
        return [
            {
                "name": name,
                "type": entry.kernel_type.name if hasattr(entry.kernel_type, 'name') else str(entry.kernel_type),
                "status": entry.status.name,
                "is_healthy": entry.is_healthy
            }
            for name, entry in self.kernels.items()
        ]

    def start_health_monitoring(self):
        """Start background health monitoring for registered kernels."""
        pass


_registry: Optional[KernelRegistry] = None

def get_registry() -> KernelRegistry:
    """Get the global kernel registry instance."""
    global _registry
    if _registry is None:
        _registry = KernelRegistry()
    return _registry

def set_registry(registry: KernelRegistry):
    """Set the global kernel registry instance."""
    global _registry
    _registry = registry
