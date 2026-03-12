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

// Core Modules
pub mod agency_tile;
pub mod agent_renderer;
pub mod alpine_vm;
pub mod alpine_vm_extension;
pub mod antigravity_watcher;
pub mod api_server;
pub mod glyph_stratum;
// pub mod app;
pub mod audio_manager;
pub mod backend;
pub mod bootable_cartridge;
pub mod bridge;
pub mod broadcast;
pub mod camera;
pub mod camera_sync;
pub mod cartridge_registry;
pub mod cartridge_texture_manager;
pub mod clipboard_manager;
pub mod clipboard_rts;
pub mod clipboard_texture_manager;
pub mod cognitive;
pub mod cognitive_territory;
pub mod competition;
pub mod compiler_tile;
pub mod compositor;
pub mod compositor_state;
pub mod cortex;
pub mod damage_tracker;
pub mod diagnostic;
pub mod entities;
pub mod evolution_daemon_wrapper;
pub mod evolution_manager;
pub mod evolution_protocol;
pub mod evolution_terrain_bridge;
pub mod filesystem_hilbert;
pub mod file_tensor;
pub mod fitness_evaluator;
pub mod flash_texture;
pub mod font_atlas;
pub mod font_bitmap;
pub mod foundry;
pub mod geometric_terminal_tile;
pub mod glass_ram;
pub mod glyph_atlas;
pub mod glyph_substrate;
pub mod gpu;
pub mod gpu_capabilities;
pub mod graph_renderer;
pub mod hex_tensor_editor;
pub mod hilbert;
pub mod hilbert_memory;
pub mod hilbert_writer;
pub mod hot_swap;
pub mod i64_emulation;
pub mod immune_system;
pub mod infinite_map;
pub mod input;
pub mod input_manager;
pub mod inspector_ui;
pub mod jit_bridge;
pub mod leak_detector;
pub mod manifest_writer;
pub mod map_loader;
pub mod memory_artifacts;
pub mod memory_graph;
pub mod memory_inspector;
pub mod memory_raycaster;
pub mod memory_tensor;
pub mod memory_texture;
pub mod memory_texture_manager;
pub mod multi_vm_manager;
pub mod neural_console;
pub mod neural_state;
pub mod neural_state_texture;
pub mod neural_terrain;
pub mod process_tile;
pub mod python_runtime;
pub mod qemu;
pub mod renderer;
pub mod rendering;
pub mod riscv;
pub mod riscv_executor;
pub mod riscv_linux_vm;
pub mod riscv_native;
pub mod rts;
pub mod rts_texture;
pub mod semantic_mutator;
pub mod source_city;
pub mod source_importer;
pub mod surface_manager;
pub mod synapse;
pub mod tectonic;
pub mod tectonic_simulator;
pub mod terminal_clone;
pub mod terminal_emulator;
pub mod terminal_tile;
pub mod terrain_raycaster;
pub mod text_engine;
pub mod thought_renderer;
pub mod tile;
pub mod tile_executor;
pub mod tool_adapter;
pub mod tool_manager;
pub mod ui;
pub mod vector_memory_client;
pub mod virtual_machine;
pub mod visual_ast;
pub mod visual_ast_renderer;
pub mod visual_cortex;
pub mod visual_feedback;
pub mod vm_texture_manager;
pub mod window;

// Phase 51: Agency Tile - Spatial Persona Binding
pub use agency_tile::{
    AgencyDivision, AgencyTile, Color, PersonaInjector, PersonaShiftEvent,
};

// Phase 30.8: Damage tracking for partial terminal updates
pub use damage_tracker::{DamageTracker, DirtyRect};

// Test utilities for benchmarks and compliance tests
pub mod tests;

// Phase 35.9: Cartridge registry for evolution zone
pub use cartridge_registry::{CartridgeEntry, CartridgeRegistry};

// Phase 35.9.1: Cartridge texture manager for evolution zone
pub use cartridge_texture_manager::{
    CartridgeTexture, CartridgeTextureManager, CartridgeTextureStats,
};

// Phase 28: Tectonic Realignment System
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
