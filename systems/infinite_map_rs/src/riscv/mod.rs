//! RISC-V GPU VM Module
//!
//! This module provides the complete RISC-V GPU VM implementation for
//! running RISC-V programs encoded in the .rts.png format.

pub mod executor;
pub mod hooks;
pub mod memory;
pub mod pipeline;
pub mod program;

pub use executor::{ExecutionResult, RiscvExecutor};
pub use hooks::{AsciiSceneHook, HeatHook, RiscvHook, RiscvHookBroadcaster, WebSocketHook};
pub use memory::{
    CSRBank, Config, ExecutionState, MMIOState, VMMemoryLayout, RAM_SIZE, REGISTER_COUNT,
};
pub use pipeline::RiscvPipeline;
pub use program::{ProgramMetadata, RiscvProgram};
