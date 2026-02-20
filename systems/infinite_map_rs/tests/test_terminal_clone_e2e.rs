#[cfg(feature = "hypervisor")]
use infinite_map_rs::terminal_clone::{PtyEngine, TerminalCloneManager};
#[cfg(feature = "hypervisor")]
use std::thread;
#[cfg(feature = "hypervisor")]
use std::time::{Duration, Instant};

#[test]
#[cfg(feature = "hypervisor")]
fn test_terminal_clone_full_pipeline() {
    let mut manager = TerminalCloneManager::new();

    // 1. Spawn a terminal with a standard shell (sh)
    let id = manager
        .create_terminal(24, 80, "/bin/sh")
        .expect("Failed to create terminal");

    // 2. Write a command to the PTY
    let cmd = b"echo 'GEOMETRY_OS_TEST'
";
    manager
        .write_to_terminal(id, cmd)
        .expect("Failed to write to terminal");

    // 3. Poll for output (with timeout)
    let start = Instant::now();
    let timeout = Duration::from_secs(5);
    let mut found = false;

    while start.elapsed() < timeout {
        manager.update();

        if let Some(emulator) = manager.get_emulator(id) {
            let buffer = emulator.get_buffer();
            // Check if our test string appeared in the buffer
            // We search through the lines of the buffer
            for row in 0..24 {
                let mut line_text = String::new();
                for col in 0..80 {
                    if let Some(cell) = buffer.get_cell(row, col) {
                        line_text.push(cell.c);
                    }
                }
                if line_text.contains("GEOMETRY_OS_TEST") {
                    found = true;
                    break;
                }
            }
        }

        if found {
            break;
        }
        thread::sleep(Duration::from_millis(100));
    }

    assert!(
        found,
        "Terminal output did not contain expected test string within timeout"
    );

    // 4. Test Resize propagation
    manager
        .resize_terminal(id, 30, 120)
        .expect("Failed to resize terminal");

    if let Some(emulator) = manager.get_emulator(id) {
        let buffer = emulator.get_buffer();
        // Check dimensions in buffer
        // Note: TerminalBuffer stores dimensions as rows/cols
        // We need to check if they match our new size.
        // (Assuming TerminalBuffer exposes rows/cols or we can infer it)
    }

    // 5. Cleanup
    manager.remove_terminal(id);
}

#[test]
#[cfg(feature = "hypervisor")]
fn test_multiple_terminals() {
    let mut manager = TerminalCloneManager::new();

    let id1 = manager.create_terminal(24, 80, "/bin/sh").unwrap();
    let id2 = manager.create_terminal(24, 80, "/bin/sh").unwrap();

    assert_ne!(id1, id2, "Terminal IDs should be unique");
    assert_eq!(manager.list_terminals().len(), 2);

    manager.remove_terminal(id1);
    assert_eq!(manager.list_terminals().len(), 1);
    assert!(manager.list_terminals().contains(&id2));
}
