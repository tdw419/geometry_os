//! Infinite Map Renderer Library
//!
//! This library provides the core rendering and computation functionality
//! for the Geometry OS infinite map system.

pub mod compositor;
pub mod cortex;
pub mod damage_tracker;
pub mod entities;
pub mod font_bitmap;
pub mod glyph_atlas;
pub mod gpu;
pub mod hilbert;
pub mod hilbert_writer;
pub mod input;
pub mod rendering;
pub mod riscv;
pub mod riscv_executor;
pub mod riscv_native;
pub mod rts;
pub mod rts_texture;
pub mod terminal_clone;
pub mod terminal_emulator;
pub mod ui;
pub mod geometric_terminal_tile;

// Phase 30.8: Damage tracking for partial terminal updates
pub use damage_tracker::{DamageTracker, DirtyRect};

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
pub use cartridge_texture_manager::{
    CartridgeTexture, CartridgeTextureManager, CartridgeTextureStats,
};

// Phase 28: Tectonic Realignment System
pub mod tectonic;
pub use tectonic::{
    BondType, CognitiveBond, CognitiveBondGraph, ForceDirectedSolver, HilbertConstraint,
    LayoutDelta, PulseEvent, TectonicAsciiRenderer, TectonicConfig, TectonicSimulator,
};

// Re-export main types for convenience
pub use compositor::Compositor;

// RISC-V VM exports
pub use riscv_executor::{
    LinuxBundleHeader, ProfilerEntry, ProfilerStats, RiscvExecutor, RiscvStats, RiscvUniforms,
    SyscallEntry,
};
