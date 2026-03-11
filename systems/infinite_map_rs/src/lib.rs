//! Infinite Map Renderer Library
//!
//! This library provides the core rendering and computation functionality
//! for the Geometry OS infinite map system.

// Clippy configuration for stylistic lints that don't affect correctness
#![allow(clippy::derivable_impls)]
#![allow(clippy::type_complexity)]
#![allow(clippy::new_without_default)]
#![allow(clippy::unnecessary_cast)]
#![allow(clippy::manual_is_multiple_of)]
#![allow(clippy::manual_div_ceil)]
#![allow(clippy::let_and_return)]
#![allow(clippy::needless_return)]
#![allow(clippy::useless_format)]
#![allow(clippy::len_zero)]
#![allow(clippy::needless_range_loop)]
#![allow(clippy::unwrap_or_default)]
#![allow(clippy::field_reassign_with_default)]
#![allow(clippy::op_ref)]
#![allow(clippy::should_implement_trait)]
#![allow(clippy::doc_lazy_continuation)]

// Refactored app state sub-structs for improved maintainability
pub mod app_state;
pub use app_state::{
    BridgeState, CognitiveState, CompilationStatus, CompilerState, InputState, MapState,
    MemoryVisualizationState, PerformanceState, TileState, VmState, WindowState,
};

pub mod compositor;
pub mod cortex;
pub mod damage_tracker;
pub mod entities;
pub mod font_bitmap;
pub mod glyph_atlas;
pub mod glyph_substrate;
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

// Phase 51: Agency Tile - Spatial Persona Binding
pub mod agency_tile;
pub use agency_tile::{
    AgencyDivision, AgencyTile, Color, PersonaInjector, PersonaShiftEvent,
};

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

// Embodied Cognition Navigation - Immersive UX
pub mod embodied;
pub use embodied::{
    EmbodiedCognitionLayer, MomentumCamera, MomentumCameraConfig, CameraInput,
    PulseManager, Pulse, PulseType, PulseId,
    EmotionalColorSystem, EmotionalState, NeuralMetrics,
    TemporalGhostSystem, NeuralSnapshot, GhostFrame,
    GestureRecognizer, GestureType, RecognizedGesture,
};

// RISC-V VM exports
pub use riscv_executor::{
    LinuxBundleHeader, ProfilerEntry, ProfilerStats, RiscvExecutor, RiscvStats, RiscvUniforms,
    SyscallEntry,
};
