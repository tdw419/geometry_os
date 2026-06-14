//! App State Sub-Structs
//!
//! This module contains logical groupings of the InfiniteMapApp state,
//! extracted for improved maintainability and reduced coupling.
//!
//! The massive 7000+ line app.rs struct has been decomposed into:
//! - `VmState`: Virtual machine and RISC-V related state
//! - `BridgeState`: Inter-process bridges and communication
//! - `InputState`: Mouse/keyboard selection and interaction state
//! - `MemoryVisualizationState`: Memory inspection and visualization
//! - `CompilerState`: Compilation and hot-swap state
//! - `CognitiveState`: AI/cognitive system state
//! - `TileState`: Process, terminal, and filesystem tile state

use std::collections::{HashMap, HashSet};
use std::path::PathBuf;
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

use crate::gpu_capabilities::GpuCapabilities;
use crate::Compositor;

// Placeholder types for modules not yet integrated
// These will be replaced with actual implementations as modules are added

/// Placeholder Visual Cortex for AI Retina
pub struct VisualCortex {
    _placeholder: (),
}

impl VisualCortex {
    pub fn new(_path: &str) -> Self {
        Self { _placeholder: () }
    }
}

/// Placeholder for synaptic bridge
pub struct SynapticBridge;

impl Default for SynapticBridge {
    fn default() -> Self {
        Self::new()
    }
}

impl SynapticBridge {
    pub fn new() -> Self {
        Self
    }
}

#[cfg(feature = "hypervisor")]
use crate::virtual_machine::VirtualMachine;

/// Virtual Machine State
///
/// Groups all VM-related fields including RISC-V executors,
/// Linux VMs, Alpine VMs, and QEMU processes.
#[allow(clippy::derivable_impls)]
pub struct VmState {
    // Phase 30: Virtual Machine
    #[cfg(feature = "hypervisor")]
    pub vm: Option<Arc<Mutex<VirtualMachine>>>,
    #[cfg(feature = "hypervisor")]
    pub vm_window_id: Option<usize>,

    // Phase 34.4: Pixel CPU Execution
    pub riscv_executor: Option<Arc<Mutex<crate::riscv_executor::RiscvExecutor>>>,
}

impl Default for VmState {
    fn default() -> Self {
        Self {
            #[cfg(feature = "hypervisor")]
            vm: None,
            #[cfg(feature = "hypervisor")]
            vm_window_id: None,
            riscv_executor: None,
        }
    }
}

/// Bridge State
///
/// Groups all inter-process bridges including synaptic bridges,
/// QEMU bridges, Unreal bridges, and daemon connections.
pub struct BridgeState {
    // Phase 35: Synaptic Bridge
    pub synaptic_bridge: SynapticBridge,
}

impl Default for BridgeState {
    fn default() -> Self {
        Self {
            synaptic_bridge: SynapticBridge::new(),
        }
    }
}

/// Input State
///
/// Groups all mouse/keyboard interaction state including
/// text selection, dragging, and click detection.
pub struct InputState {
    pub is_panning: bool,
    pub last_mouse_pos: Option<(f32, f32)>,
    pub dragging_window: Option<usize>,
    pub is_selecting_text: bool,

    // Phase 48: Mouse Text Selection State
    pub text_selection_drag_start: Option<u32>,
    pub text_selection_last_update: Option<u32>,
    pub last_click_time: Option<Instant>,
    pub last_click_pos: Option<(f32, f32)>,
    pub click_count: u32,

    // Phase 40.2: Source City Interaction
    pub dragging_source_tile: Option<String>,
    pub source_tile_drag_start: Option<(f32, f32)>,
}

impl Default for InputState {
    fn default() -> Self {
        Self {
            is_panning: false,
            last_mouse_pos: None,
            dragging_window: None,
            is_selecting_text: false,
            text_selection_drag_start: None,
            text_selection_last_update: None,
            last_click_time: None,
            last_click_pos: None,
            click_count: 0,
            dragging_source_tile: None,
            source_tile_drag_start: None,
        }
    }
}

/// Memory Visualization State
///
/// Groups all memory inspection and visualization state including
/// texture mappers, raycasters, and artifact managers.
pub struct MemoryVisualizationState {
    // Phase 37.1: Neural Introspection - Hover-to-Query
    pub hovered_memory_address: Option<usize>,
}

impl Default for MemoryVisualizationState {
    fn default() -> Self {
        Self {
            hovered_memory_address: None,
        }
    }
}

/// Compiler State
///
/// Groups compilation and hot-swap state including
/// source crystallization, visual AST, and hot-swap tracking.
pub struct CompilerState {
    // Phase 42: Micro-Compiler Tile - Visual Feedback
    pub compilation_status: CompilationStatus,
    pub compilation_tile_path: Option<PathBuf>,
    pub compilation_start_time: Option<Instant>,
    pub path_to_artifact: HashMap<PathBuf, usize>,
    pub active_morphs: HashMap<usize, f32>,
}

impl Default for CompilerState {
    fn default() -> Self {
        Self {
            compilation_status: CompilationStatus::None,
            compilation_tile_path: None,
            compilation_start_time: None,
            path_to_artifact: HashMap::new(),
            active_morphs: HashMap::new(),
        }
    }
}

/// Phase 42: Compilation status for visual feedback
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum CompilationStatus {
    None,
    Compiling,
    #[allow(dead_code)]
    Success,
    Error,
}

/// Cognitive State
///
/// Groups AI/cognitive system state including ACE-RTS,
/// cognitive territory, and agent management.
pub struct CognitiveState {
    // Phase 46.5: Stabilization & Validation
    pub recent_agent_actions: HashMap<String, (u32, f64)>,

    // Phase 100: Visual Cortex (AI Retina)
    pub visual_cortex: VisualCortex,
}

impl CognitiveState {
    pub fn new(visual_cortex_path: &str) -> Self {
        Self {
            recent_agent_actions: HashMap::new(),
            visual_cortex: VisualCortex::new(visual_cortex_path),
        }
    }
}

/// Tile State
///
/// Groups process, terminal, and filesystem tile state.
pub struct TileState {
    pub pid_to_window: HashMap<u32, usize>,

    #[cfg(feature = "hypervisor")]
    pub terminal_clone_manager: Option<crate::terminal_clone::TerminalCloneManager>,

    // Shader Execution Zone
    pub compositor: Option<Compositor>,
}

impl Default for TileState {
    fn default() -> Self {
        Self {
            pid_to_window: HashMap::new(),
            #[cfg(feature = "hypervisor")]
            terminal_clone_manager: Some(crate::terminal_clone::TerminalCloneManager::new()),
            compositor: None,
        }
    }
}

/// Performance State
///
/// Groups profiling and performance monitoring state.
pub struct PerformanceState {
    // Phase 33: Performance Metrics
    pub last_fps_log: Instant,
    pub frame_count: u32,

    // Phase 44: JIT Profiler
    pub profiler_enabled: bool,
    pub profiler_interval: Duration,
    pub profiler_last_poll: Instant,

    // Phase 48: GPU Capabilities
    pub gpu_caps: GpuCapabilities,
}

impl Default for PerformanceState {
    fn default() -> Self {
        Self {
            last_fps_log: Instant::now(),
            frame_count: 0,
            profiler_enabled: false,
            profiler_interval: Duration::from_secs(1),
            profiler_last_poll: Instant::now(),
            gpu_caps: GpuCapabilities {
                supports_i64: true,
                vendor_name: "Unknown".to_string(),
                device_name: "Unknown".to_string(),
            },
        }
    }
}

/// Map State
///
/// Groups map loading, auto-save, and artifact tracking state.
pub struct MapState {
    pub spawned_map_artifacts: HashSet<(i32, i32)>,

    // Phase Mode B.2: Spatial Auto-Save System
    pub current_tile_x: Option<i32>,
    pub current_tile_y: Option<i32>,
    pub last_auto_save_time: Instant,
}

impl Default for MapState {
    fn default() -> Self {
        Self {
            spawned_map_artifacts: HashSet::new(),
            current_tile_x: None,
            current_tile_y: None,
            last_auto_save_time: Instant::now(),
        }
    }
}

/// Window State
///
/// Groups window ID tracking and UI state.
pub struct WindowState {
    pub evolution_window_id: Option<usize>,
    pub intent_window_id: Option<usize>,
    pub overlay_window_id: Option<usize>,
    pub antigravity_window_id: Option<usize>,
    pub diagnostic_window_id: Option<usize>,
    pub neural_console_window_id: Option<usize>,
    pub inspector_visible: bool,
}

impl Default for WindowState {
    fn default() -> Self {
        Self {
            evolution_window_id: None,
            intent_window_id: None,
            overlay_window_id: None,
            antigravity_window_id: None,
            diagnostic_window_id: None,
            neural_console_window_id: None,
            inspector_visible: false,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_input_state_default() {
        let state = InputState::default();
        assert!(!state.is_panning);
        assert!(state.last_mouse_pos.is_none());
        assert_eq!(state.click_count, 0);
    }

    #[test]
    fn test_performance_state_default() {
        let state = PerformanceState::default();
        assert!(!state.profiler_enabled);
        assert_eq!(state.profiler_interval, Duration::from_secs(1));
    }

    #[test]
    fn test_vm_state_default() {
        let state = VmState::default();
        assert!(state.riscv_executor.is_none());
    }
}
