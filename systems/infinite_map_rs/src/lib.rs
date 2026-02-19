//! Infinite Map Renderer Library
//!
//! This library provides the core rendering and computation functionality
//! for the Geometry OS infinite map system.

pub mod entities;
pub mod rts_texture;
pub mod rts;
pub mod gpu;
pub mod rendering;
pub mod input;
pub mod compositor;
pub mod ui;
pub mod hilbert;
pub mod hilbert_writer;
pub mod riscv;
pub mod riscv_executor;
pub mod riscv_native;
pub mod cortex;

// Phase 48: GPU capability detection and i64 emulation
pub mod gpu_capabilities;
pub mod i64_emulation;

// Test utilities for benchmarks and compliance tests
pub mod tests;

// WebSocket broadcast module with backpressure
pub mod broadcast;

// Phase 35.9: Cartridge registry for evolution zone
pub mod cartridge_registry;
pub use cartridge_registry::{CartridgeEntry, CartridgeRegistry};

// Phase 35.9.1: Cartridge texture manager for evolution zone
pub mod cartridge_texture_manager;
pub use cartridge_texture_manager::{CartridgeTextureManager, CartridgeTexture, CartridgeTextureStats};

// Phase 28: Tectonic Realignment System
pub mod tectonic;
pub use tectonic::{
    TectonicSimulator, TectonicConfig, PulseEvent, LayoutDelta,
    CognitiveBond, CognitiveBondGraph, BondType,
    ForceDirectedSolver, HilbertConstraint, TectonicAsciiRenderer,
};

// Re-export main types for convenience
pub use compositor::Compositor;

// RISC-V VM exports
pub use riscv_executor::{
    RiscvExecutor, RiscvUniforms, RiscvStats,
    SyscallEntry, ProfilerEntry, ProfilerStats,
    LinuxBundleHeader,
};
