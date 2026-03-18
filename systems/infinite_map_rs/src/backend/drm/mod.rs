//! DRM/KMS Backend - Direct GPU execution via Linux DRM subsystem.
//!
//! This module provides direct GPU access via DRM/KMS for Phase 2
//! of the Glyph-to-Metal pipeline.

pub mod amdgpu;
pub mod buffer_binding;
pub mod compute;
pub mod device;
pub mod dmabuf;
pub mod glyph_executor;
pub mod glyph_vm_executor;
pub mod input_bridge;
pub mod integrated_executor;
pub mod intel;
pub mod memory;
pub mod scanout;
pub mod vcc_compute;
pub mod visual_interaction_bus;

pub use amdgpu::command_buffer::AmdgpuCommandBuffer;
pub use compute::GlyphCompute;
pub use device::DrmDevice;
pub use dmabuf::{DmaBuf, ZeroCopyPipeline};
pub use glyph_executor::{
    compute_output_hash, AttestedExecutionResult, DrmGlyphExecutor, GlyphError, GlyphOutput,
};
pub use glyph_vm_executor::{GlyphVmExecutor, GlyphVmState};
pub use input_bridge::{EvdevInputBridge, InputEvent, SimulatedInputBridge};
pub use integrated_executor::{
    IntegratedExecutorConfig, IntegratedGlyphExecutor, ZeroCopyExecutionLoop,
};
pub use intel::IntelCommandBuffer;
pub use buffer_binding::{BindingPoint, BufferBindingInterface, BoundBuffer, DispatchBindings};
pub use memory::{GpuMemoryAllocator, MappedBuffer};
pub use scanout::KmsScanout;
pub use vcc_compute::{
    BufferInitDescriptor, BufferInitExt, HardwareVCC, HardwareVCCResult, VccCompute,
};
pub use visual_interaction_bus::{InputReceiver, InputState, VisualInteractionBus};
