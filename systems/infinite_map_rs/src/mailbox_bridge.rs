//! Mailbox Bridge - CPU to VM Event Forwarding
//!
//! Serializes input events to the VM mailbox format at address 0x0200.
//! Used by micro_host.rs to forward winit events to GPU VM.

/// Memory layout for input events (matches infinite_map.glyph)
pub const EVENT_BASE: u32 = 0x0200;
pub const EVENT_TYPE: u32 = 0x0200;
pub const EVENT_X: u32 = 0x0204;
pub const EVENT_Y: u32 = 0x0208;
pub const EVENT_BTN: u32 = 0x020C;
pub const EVENT_DX: u32 = 0x0210;
pub const EVENT_DY: u32 = 0x0214;

/// Input event types
#[derive(Debug, Clone, Copy)]
pub enum InputEvent {
    MouseMove { x: u32, y: u32, dx: i32, dy: i32 },
    Click { x: u32, y: u32, button: u32 },
    Scroll { dx: i32, dy: i32 },
}

/// Bridge for writing events to VM mailbox
pub struct MailboxBridge {
    mailbox: [u32; 6],
}

impl MailboxBridge {
    pub fn new() -> Self {
        Self { mailbox: [0; 6] }
    }

    /// Write an event to the mailbox
    pub fn write_event(&mut self, event: InputEvent) {
        match event {
            InputEvent::MouseMove { x, y, dx, dy } => {
                self.mailbox[0] = 1; // EVENT_TYPE_MOUSE_MOVE
                self.mailbox[1] = x;
                self.mailbox[2] = y;
                self.mailbox[3] = 0;
                self.mailbox[4] = dx as u32;
                self.mailbox[5] = dy as u32;
            }
            InputEvent::Click { x, y, button } => {
                self.mailbox[0] = 2; // EVENT_TYPE_CLICK
                self.mailbox[1] = x;
                self.mailbox[2] = y;
                self.mailbox[3] = button;
                self.mailbox[4] = 0;
                self.mailbox[5] = 0;
            }
            InputEvent::Scroll { dx, dy } => {
                self.mailbox[0] = 4; // EVENT_TYPE_SCROLL
                self.mailbox[1] = 0;
                self.mailbox[2] = 0;
                self.mailbox[3] = 0;
                self.mailbox[4] = dx as u32;
                self.mailbox[5] = dy as u32;
            }
        }
    }

    /// Read the mailbox as raw words (for GPU upload)
    pub fn read_mailbox(&self) -> &[u32; 6] {
        &self.mailbox
    }

    /// Clear the event (set type to 0)
    pub fn clear_event(&mut self) {
        self.mailbox[0] = 0;
    }
}

impl Default for MailboxBridge {
    fn default() -> Self {
        Self::new()
    }
}
