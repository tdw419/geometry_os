//! RISC-V GPU VM Module
//!
//! This module provides the complete RISC-V GPU VM implementation for
//! running RISC-V programs encoded in the .rts.png format.

pub mod executor;
pub mod hooks;
pub mod memory;
pub mod native_rv64;
pub mod pipeline;
pub mod program;
pub mod ubuntu_bridge;

pub use executor::{ExecutionResult, RiscvExecutor};
pub use hooks::{AsciiSceneHook, HeatHook, RiscvHook, RiscvHookBroadcaster, WebSocketHook};
pub use memory::{
    CSRBank, Config, ExecutionState, MMIOState, VMMemoryLayout, RAM_SIZE, REGISTER_COUNT,
};
pub use native_rv64::{NativeRv64Executor, Riscv64State, Rv64PushConstants};
pub use pipeline::RiscvPipeline;
pub use program::{ProgramMetadata, RiscvProgram};
pub use ubuntu_bridge::{UbuntuKernelInput, UbuntuRv64Bridge, Rv64Result};
