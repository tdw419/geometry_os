//! DRM/KMS Backend - Direct GPU execution via Linux DRM subsystem.
//!
//! This module provides direct GPU access via DRM/KMS for Phase 2
//! of the Glyph-to-Metal pipeline.

pub mod device;
pub mod scanout;
pub mod compute;
pub mod dmabuf;
pub mod amdgpu;
pub mod intel;
pub mod vcc_compute;
pub mod glyph_executor;
pub mod glyph_vm_executor;
pub mod visual_interaction_bus;
pub mod input_bridge;
pub mod integrated_executor;

pub use device::DrmDevice;
pub use scanout::KmsScanout;
pub use compute::GlyphCompute;
pub use dmabuf::{DmaBuf, ZeroCopyPipeline};
pub use amdgpu::command_buffer::AmdgpuCommandBuffer;
pub use intel::IntelCommandBuffer;
pub use vcc_compute::{VccCompute, HardwareVCC, HardwareVCCResult, BufferInitExt, BufferInitDescriptor};
pub use glyph_executor::{DrmGlyphExecutor, GlyphError, GlyphOutput, AttestedExecutionResult, compute_output_hash};
pub use glyph_vm_executor::{GlyphVmExecutor, GlyphVmState};
pub use visual_interaction_bus::{VisualInteractionBus, InputState, InputReceiver};
pub use input_bridge::{EvdevInputBridge, SimulatedInputBridge, InputEvent};
pub use integrated_executor::{IntegratedGlyphExecutor, IntegratedExecutorConfig, ZeroCopyExecutionLoop};
