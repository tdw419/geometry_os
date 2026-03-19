//! Mailbox Bridge Tests

use infinite_map_rs::mailbox_bridge::{MailboxBridge, InputEvent};

#[test]
fn test_mouse_move_event_serialization() {
    let mut bridge = MailboxBridge::new();

    let event = InputEvent::MouseMove { x: 100, y: 200, dx: 5, dy: -3 };
    bridge.write_event(event);

    let words = bridge.read_mailbox();
    assert_eq!(words[0], 1, "Event type 1 = MouseMove");
    assert_eq!(words[1], 100, "X coordinate");
    assert_eq!(words[2], 200, "Y coordinate");
    assert_eq!(words[4], 5, "DX delta");
    assert_eq!(words[5], 0xFFFFFFFD_u32, "DY delta (signed -3)");
}

#[test]
fn test_click_event_serialization() {
    let mut bridge = MailboxBridge::new();

    let event = InputEvent::Click { x: 150, y: 300, button: 1 };
    bridge.write_event(event);

    let words = bridge.read_mailbox();
    assert_eq!(words[0], 2, "Event type 2 = Click");
    assert_eq!(words[1], 150, "X coordinate");
    assert_eq!(words[2], 300, "Y coordinate");
    assert_eq!(words[3], 1, "Button");
    assert_eq!(words[4], 0, "DX should be 0");
    assert_eq!(words[5], 0, "DY should be 0");
}

#[test]
fn test_scroll_event_serialization() {
    let mut bridge = MailboxBridge::new();

    let event = InputEvent::Scroll { dx: 0, dy: 120 };
    bridge.write_event(event);

    let words = bridge.read_mailbox();
    assert_eq!(words[0], 4, "Event type 4 = Scroll");
    assert_eq!(words[1], 0, "X should be 0");
    assert_eq!(words[2], 0, "Y should be 0");
    assert_eq!(words[3], 0, "Button should be 0");
    assert_eq!(words[4], 0, "DX delta");
    assert_eq!(words[5], 120, "DY delta (scroll up)");
}

#[test]
fn test_clear_event() {
    let mut bridge = MailboxBridge::new();

    bridge.write_event(InputEvent::Click { x: 100, y: 200, button: 1 });
    assert_ne!(bridge.read_mailbox()[0], 0, "Event type should be non-zero before clear");

    bridge.clear_event();
    let words = bridge.read_mailbox();
    assert_eq!(words[0], 0, "Event type should be 0 after clear");
    assert_eq!(words[1], 0, "X should be 0 after clear");
    assert_eq!(words[2], 0, "Y should be 0 after clear");
}

#[test]
fn test_event_override() {
    let mut bridge = MailboxBridge::new();

    bridge.write_event(InputEvent::MouseMove { x: 100, y: 200, dx: 5, dy: -3 });
    assert_eq!(bridge.read_mailbox()[0], 1, "First event type should be MouseMove");

    bridge.write_event(InputEvent::Click { x: 50, y: 75, button: 2 });
    let words = bridge.read_mailbox();
    assert_eq!(words[0], 2, "Second event type should override with Click");
    assert_eq!(words[1], 50, "X should be overridden");
    assert_eq!(words[2], 75, "Y should be overridden");
}
