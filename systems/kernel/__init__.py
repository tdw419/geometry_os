"""
Geometry OS - Unified Neural Kernel Interface

This module provides a unified interface for all neural kernel operations
in Geometry OS, consolidating GPU-resident simulation, hybrid 1.0/2.0
dispatch, and attention-based opcode dispatch into a single API.

Quick Start:
    from systems.kernel import KernelFactory, KernelType

    # Create a hybrid kernel
    kernel = KernelFactory.create("hybrid")
    kernel.initialize()

    # Dispatch a syscall
    from systems.kernel import KernelRequest, SysCall
    request = KernelRequest(1, SysCall.READ, {"address": 0x1000})
    result = kernel.dispatch_syscall(request)

    # Run inference
    output = kernel.run_inference(input_data)

Using the Registry:
    from systems.kernel import KernelRegistry, get_registry

    registry = get_registry()
    registry.register("main", kernel, make_active=True)

    # Hot-swap
    registry.swap("backup")

Architecture Overview:
    ┌─────────────────────────────────────────────────────────┐
    │                   KernelFactory                         │
    │  - Creates kernel instances by type                     │
    │  - Auto-selects based on configuration                  │
    ├─────────────────────────────────────────────────────────┤
    │                                                         │
    │  ┌─────────────────────────────────────────────────┐   │
    │  │           NeuralKernelInterface                  │   │
    │  │  (Abstract base for all kernels)                │   │
    │  └─────────────────────────────────────────────────┘   │
    │            ▲              ▲              ▲             │
    │            │              │              │             │
    │  ┌─────────┴───┐  ┌──────┴─────┐  ┌─────┴──────┐     │
    │  │GPUResident  │  │  Hybrid    │  │ Dispatcher │     │
    │  │  Kernel     │  │  Kernel    │  │  Kernel    │     │
    │  │ (wgpu)      │  │ (1.0+2.0)  │  │ (attention)│     │
    │  └─────────────┘  └────────────┘  └────────────┘     │
    │                                                         │
    ├─────────────────────────────────────────────────────────┤
    │                   KernelRegistry                        │
    │  - Hot-swap kernels at runtime                         │
    │  - Health monitoring and failover                      │
    │  - Version control and rollback                        │
    └─────────────────────────────────────────────────────────┘
"""

# Core interface
from .unified_neural_kernel import (
    # Abstract interface
    NeuralKernelInterface,

    # Enums
    SysCall,
    KernelType,
    KernelState,

    # Data classes
    KernelRequest,
    KernelResult,
    KernelMetrics,
    KernelConfig,

    # Factory
    KernelFactory,
    register_kernel,
)

# Kernel implementations
from .gpu_resident_kernel import GPUResidentKernel
from .hybrid_kernel import HybridKernel
from .dispatcher_kernel import DispatcherKernel

# Registry
from .kernel_registry import (
    KernelRegistry,
    KernelStatus,
    KernelEntry,
    RegistryMetrics,
    get_registry,
    set_registry,
)

# Bridge for WebMCP integration
from .bridge import (
    KernelBridge,
    BridgeConfig,
    get_bridge,
    set_bridge,
)

# Orchestration components (Phase L - Multi-Kernel)
from .orchestration import (
    OrchestrationEngine,
    OrchestrationConfig,
    OrchestrationMetrics,
    RoutingStrategy,
)
from .cluster import (
    KernelCluster,
    ClusterConfig,
    ClusterStatus,
)
from .inter_kernel_bus import (
    InterKernelBus,
    BusMessage,
    BusTopic,
)
from .load_balancer import (
    LoadBalancer,
    LoadBalancerConfig,
    KernelLoad,
)
from .cluster_metrics import (
    ClusterMetricsCollector,
    ClusterMetrics,
    KernelMetricsSnapshot,
)
from .orchestration_tools import OrchestrationTools

# Convenience exports
__all__ = [
    # Interface
    "NeuralKernelInterface",

    # Enums
    "SysCall",
    "KernelType",
    "KernelState",
    "KernelStatus",

    # Data classes
    "KernelRequest",
    "KernelResult",
    "KernelMetrics",
    "KernelConfig",

    # Factory
    "KernelFactory",
    "register_kernel",

    # Implementations
    "GPUResidentKernel",
    "HybridKernel",
    "DispatcherKernel",

    # Registry
    "KernelRegistry",
    "KernelEntry",
    "RegistryMetrics",
    "get_registry",
    "set_registry",

    # Bridge
    "KernelBridge",
    "BridgeConfig",
    "get_bridge",
    "set_bridge",

    # Orchestration (Phase L)
    "OrchestrationEngine",
    "OrchestrationConfig",
    "OrchestrationMetrics",
    "RoutingStrategy",
    "KernelCluster",
    "ClusterConfig",
    "ClusterStatus",
    "InterKernelBus",
    "BusMessage",
    "BusTopic",
    "LoadBalancer",
    "LoadBalancerConfig",
    "KernelLoad",
    "ClusterMetricsCollector",
    "ClusterMetrics",
    "KernelMetricsSnapshot",
    "OrchestrationTools",
]


def create_default_kernel(gpu_enabled: bool = True) -> NeuralKernelInterface:
    """
    Create a default kernel instance with sensible defaults.

    Args:
        gpu_enabled: Whether to enable GPU acceleration

    Returns:
        Initialized kernel instance
    """
    config = KernelConfig(
        kernel_type=KernelType.HYBRID,
        gpu_enabled=gpu_enabled,
    )

    kernel = KernelFactory.create(KernelType.HYBRID, config=config)
    kernel.initialize()

    return kernel


def create_full_stack(
    gpu_enabled: bool = True,
) -> tuple[KernelRegistry, HybridKernel, GPUResidentKernel, DispatcherKernel]:
    """
    Create a full kernel stack with registry.

    This creates all three kernel types and registers them
    with a central registry for hot-swapping.

    Args:
        gpu_enabled: Whether to enable GPU acceleration

    Returns:
        Tuple of (registry, hybrid_kernel, gpu_kernel, dispatcher_kernel)
    """
    config = KernelConfig(gpu_enabled=gpu_enabled)

    # Create kernels
    hybrid = HybridKernel(config=config)
    gpu = GPUResidentKernel(config=config)
    dispatcher = DispatcherKernel(config=config)

    # Initialize
    hybrid.initialize()
    gpu.initialize()
    dispatcher.initialize()

    # Create registry and register
    registry = KernelRegistry()
    registry.register("hybrid", hybrid, KernelType.HYBRID, make_active=True)
    registry.register("gpu", gpu, KernelType.GPU_RESIDENT)
    registry.register("dispatcher", dispatcher, KernelType.DISPATCHER)

    # Start health monitoring
    registry.start_health_monitoring()

    return registry, hybrid, gpu, dispatcher
