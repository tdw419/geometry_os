//! Geos-Boot: Frozen Rust Bootloader for Geometry OS
//!
//! This crate provides the immutable CPU shell that:
//! - Initializes WebGPU surface
//! - Forwards events to GPU mailbox at 0x200
//! - Loads .glyph programs into GPU memory
//!
//! After freeze, no modifications to this code are permitted.
//! All evolution happens in WGSL shaders.

pub mod io_contract;
pub mod gpu_requirements;
pub mod adapter_selector;
pub mod glyph_loader;
pub mod bootstrap;

pub use bootstrap::{FrozenBootstrap, run};
pub use glyph_loader::GlyphProgram;
pub use io_contract::{Event, EventsBuffer, Mailbox, VmState};
pub use gpu_requirements::{validate_gpu, GpuRequirements, ValidationResult, ValidationError};
pub use adapter_selector::AdapterSelector;

pub const GEOS_BOOT_VERSION: &str = env!("CARGO_PKG_VERSION");
