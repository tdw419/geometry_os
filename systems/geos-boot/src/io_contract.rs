//! Geos-Boot I/O Contract v1.0
//!
//! Immutable interface between frozen CPU and evolving GPU.
//! This module is FROZEN - no changes after freeze ceremony.

#![allow(dead_code)]

use bytemuck::{Pod, Zeroable};

pub const IO_CONTRACT_VERSION: u32 = 1;

// Memory layout matching existing Glyph VM
pub const VM_STATE_OFFSET: u64 = 0x0000;      // 512 bytes - PC, registers, flags
pub const MAILBOX_OFFSET: u64 = 0x0200;       // 256 bytes - CPU->GPU events
pub const EVENT_BUFFER_OFFSET: u64 = 0x0300;  // 1024 bytes - event queue
pub const PROGRAM_MEMORY_OFFSET: u64 = 0x1000; // ~1MB - glyph programs

pub const VM_STATE_SIZE: u64 = 512;
pub const MAILBOX_SIZE: u64 = 256;
pub const EVENT_BUFFER_SIZE: u64 = 1024;
pub const PROGRAM_MEMORY_SIZE: u64 = 1_048_576; // 1 MiB

pub const TOTAL_IO_SIZE: u64 = VM_STATE_SIZE + MAILBOX_SIZE + EVENT_BUFFER_SIZE + PROGRAM_MEMORY_SIZE;

// Event type codes (match gvpie_bootstrap)
pub const EVENT_MOUSE_MOVE: u32 = 1;
pub const EVENT_MOUSE_BUTTON: u32 = 2;
pub const EVENT_KEYBOARD: u32 = 3;
pub const EVENT_SCROLL: u32 = 4;

pub const MAX_EVENTS_PER_FRAME: usize = 64;

/// Single event entry - 4 u32 words (16 bytes)
#[repr(C)]
#[derive(Clone, Copy, Debug, Default, Pod, Zeroable)]
pub struct Event {
    pub event_type: u32,
    pub param_1: u32,  // x/scanCode/button
    pub param_2: u32,  // y/keyCode/state
    pub param_3: u32,  // mods/clicks/deltaY
}

impl Event {
    pub fn none() -> Self {
        Self::default()
    }

    pub fn mouse_move(x: f32, y: f32, width: f32, height: f32) -> Self {
        Self {
            event_type: EVENT_MOUSE_MOVE,
            param_1: x.to_bits(),
            param_2: y.to_bits(),
            param_3: ((width as u32) << 16) | (height as u32),
        }
    }

    pub fn mouse_button(button: u32, pressed: bool) -> Self {
        Self {
            event_type: EVENT_MOUSE_BUTTON,
            param_1: button,
            param_2: if pressed { 1 } else { 0 },
            param_3: 0,
        }
    }

    pub fn keyboard(keycode: u32, modifiers: u32) -> Self {
        Self {
            event_type: EVENT_KEYBOARD,
            param_1: keycode,
            param_2: modifiers,
            param_3: 0,
        }
    }

    pub fn scroll(delta_y: f32) -> Self {
        Self {
            event_type: EVENT_SCROLL,
            param_1: delta_y.to_bits(),
            param_2: 0,
            param_3: 0,
        }
    }
}

/// Event buffer for CPU->GPU communication
#[repr(C)]
#[derive(Clone, Copy)]
pub struct EventsBuffer {
    pub version: u32,
    pub frame_number: u32,
    pub event_count: u32,
    pub _padding: u32,
    pub events: [Event; MAX_EVENTS_PER_FRAME],
}

impl EventsBuffer {
    pub fn new() -> Self {
        Self {
            version: IO_CONTRACT_VERSION,
            frame_number: 0,
            event_count: 0,
            _padding: 0,
            events: [Event::none(); MAX_EVENTS_PER_FRAME],
        }
    }

    pub fn clear(&mut self) {
        self.event_count = 0;
        self.frame_number += 1;
    }

    pub fn push(&mut self, event: Event) -> bool {
        if (self.event_count as usize) < MAX_EVENTS_PER_FRAME {
            self.events[self.event_count as usize] = event;
            self.event_count += 1;
            true
        } else {
            false
        }
    }

    pub fn as_bytes(&self) -> &[u8] {
        unsafe {
            std::slice::from_raw_parts(
                self as *const Self as *const u8,
                std::mem::size_of::<Self>(),
            )
        }
    }
}

impl Default for EventsBuffer {
    fn default() -> Self {
        Self::new()
    }
}

/// VM state header at offset 0x0000 (512 bytes)
#[repr(C)]
#[derive(Clone, Copy, Debug)]
pub struct VmState {
    pub pc: u32,
    pub cycle: u32,
    pub halted: u32,
    pub _padding: u32,
    pub registers: [u32; 120], // 480 bytes of registers
}

impl Default for VmState {
    fn default() -> Self {
        Self {
            pc: 0,
            cycle: 0,
            halted: 0,
            _padding: 0,
            registers: [0u32; 120],
        }
    }
}

/// Mailbox at offset 0x0200 (256 bytes)
#[repr(C)]
#[derive(Clone, Copy, Debug)]
pub struct Mailbox {
    pub command: u32,
    pub param_a: u32,
    pub param_b: u32,
    pub param_c: u32,
    pub response: u32,
    pub status: u32,
    pub _reserved: [u32; 58], // Pad to 256 bytes
}

impl Default for Mailbox {
    fn default() -> Self {
        Self {
            command: 0,
            param_a: 0,
            param_b: 0,
            param_c: 0,
            response: 0,
            status: 0,
            _reserved: [0u32; 58],
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_event_sizes() {
        assert_eq!(std::mem::size_of::<Event>(), 16);
    }

    #[test]
    fn test_events_buffer_push() {
        let mut buf = EventsBuffer::new();
        assert!(buf.push(Event::keyboard(65, 0)));
        assert_eq!(buf.event_count, 1);
    }

    #[test]
    fn test_offsets_aligned() {
        assert_eq!(MAILBOX_OFFSET, VM_STATE_OFFSET + VM_STATE_SIZE);
        assert_eq!(EVENT_BUFFER_OFFSET, MAILBOX_OFFSET + MAILBOX_SIZE);
    }
}
