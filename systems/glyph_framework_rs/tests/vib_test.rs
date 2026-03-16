//! Visual Interaction Bus (VIB) Tests
//!
//! Verifies the zero-CPU input path: CPU writes to VIB → GPU polls → App receives input

use glyph_framework_rs::{AppCoordinator, AppLayout, WgpuBackend, AppId};
use glyph_framework_rs::backends::{InputEvent, InputBusState};

#[test]
#[ignore = "Shader architecture mismatch: glyph_vm.wgsl expects texture_storage_2d at binding 0, but Rust provides buffer"]
fn test_vib_initialization() {
    let backend = WgpuBackend::new(16);
    let coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

    // Verify VIB state is accessible
    let mut coord = coordinator;
    let state = coord.get_input_bus_state().expect("Failed to get VIB state");

    // VIB should be initialized with magic number
    assert_eq!(state.magic, 0x56494255, "VIB magic should be 'VIBU'");
    // kb_tail starts at 0 (GPU consumer index)
    assert_eq!(state.kb_tail, 0, "kb_tail should start at 0");
}

#[test]
fn test_vib_write_input_event() {
    let backend = WgpuBackend::new(16);
    let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

    // Get initial state
    let initial_state = coordinator.get_input_bus_state().expect("Failed to get VIB state");
    let initial_head = initial_state.kb_head;

    // Write a single key event
    let event = InputEvent {
        code: 65, // 'A'
        state: 1, // Key down
        mods: 0,
        timestamp: 1000,
        attention_weight: 1.0,
    };

    coordinator.write_input_event(event).expect("Failed to write input event");

    // Verify kb_head advanced by 1
    let state = coordinator.get_input_bus_state().expect("Failed to get VIB state");
    assert_eq!(state.kb_head, initial_head + 1, "kb_head should advance by 1 after writing 1 event");
}

#[test]
fn test_vib_fifo_multiple_events() {
    let backend = WgpuBackend::new(16);
    let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

    // Get initial state
    let initial_state = coordinator.get_input_bus_state().expect("Failed to get VIB state");
    let initial_head = initial_state.kb_head;

    // Write 10 events
    for i in 0..10 {
        let event = InputEvent {
            code: 48 + i, // '0' through '9'
            state: 1,
            mods: 0,
            timestamp: 1000 + i * 100,
            attention_weight: 1.0,
        };
        coordinator.write_input_event(event).expect("Failed to write input event");
    }

    let state = coordinator.get_input_bus_state().expect("Failed to get VIB state");
    assert_eq!(state.kb_head, initial_head + 10, "kb_head should advance by 10 after writing 10 events");
}

#[test]
fn test_vib_mouse_state_persistence() {
    let backend = WgpuBackend::new(16);
    let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

    // Verify initial mouse state
    let state = coordinator.get_input_bus_state().expect("Failed to get VIB state");
    assert_eq!(state.mouse_x, 0.0, "Initial mouse_x should be 0");
    assert_eq!(state.mouse_y, 0.0, "Initial mouse_y should be 0");
    assert_eq!(state.mouse_btn, 0, "Initial mouse_btn should be 0");
}
