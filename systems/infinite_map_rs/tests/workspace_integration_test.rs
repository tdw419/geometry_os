// tests/workspace_integration_test.rs
//! Workspace Integration Tests
//!
//! Verifies the complete GPU-native workspace pipeline.

use infinite_map_rs::ascii_cartridge::AsciiCartridge;
use infinite_map_rs::ascii_native::workspace_cartridge::generate_workspace_cartridge;
use infinite_map_rs::mailbox_bridge::{InputEvent, MailboxBridge};
use std::path::PathBuf;

fn temp_path(name: &str) -> PathBuf {
    std::env::temp_dir().join(name)
}

#[test]
fn test_workspace_cartridge_loads() {
    let output = temp_path("test_workspace_load.rts.png");
    generate_workspace_cartridge(&output).expect("Should generate");
    assert!(output.exists(), "Cartridge file should exist");

    let cartridge = AsciiCartridge::load(&output).expect("Should load");
    assert!(!cartridge.program_buffer.is_empty(), "Should have program");

    std::fs::remove_file(&output).ok();
}

#[test]
fn test_mailbox_bridge_generates_valid_events() {
    let mut bridge = MailboxBridge::new();

    // Simulate mouse movement
    bridge.write_event(InputEvent::MouseMove {
        x: 100,
        y: 200,
        dx: 5,
        dy: -3,
    });
    let words = bridge.read_mailbox();
    assert_eq!(words[0], 1, "Event type should be MouseMove");
    assert_eq!(words[1], 100, "X should be 100");
    assert_eq!(words[2], 200, "Y should be 200");
    assert_eq!(words[4], 5, "DX should be 5");
    assert_eq!(words[5], 0xFFFFFFFD_u32, "DY should be -3");
}
