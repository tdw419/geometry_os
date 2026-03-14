//! Evdev Input Bridge - Hardware Input to Visual Interaction Bus
//!
//! This module reads input events directly from Linux evdev devices
//! and routes them to the Visual Interaction Bus with zero latency.
//!
//! ## Architecture
//!
//! ```text
//! [Mouse Hardware] ──→ [/dev/input/eventX] ──→ [EvdevInputBridge]
//!                                                   │
//!                                                   ▼
//!                                        [VisualInteractionBus]
//!                                                   │
//!                                                   ▼
//!                                          [GPU memory[0-4]]
//! ```
//!
//! ## Security Model
//!
//! The evdev bridge requires root or input group membership.
//! In production, this is replaced by a kernel module that writes
//! directly to the DMA-BUF backing the interaction bus memory.

use std::fs::File;
use std::io::Read;
use std::os::unix::io::AsRawFd;
use std::path::PathBuf;
use std::collections::HashMap;

use super::visual_interaction_bus::InputState;

/// Evdev input event (from Linux input.h)
#[repr(C)]
#[derive(Copy, Clone, Debug)]
pub struct EvdevEvent {
    pub tv_sec: u64,
    pub tv_usec: u64,
    pub event_type: u16,
    pub code: u16,
    pub value: i32,
}

/// Types of input events we handle
#[derive(Copy, Clone, Debug, PartialEq)]
pub enum InputEvent {
    /// Mouse moved to absolute position
    MouseMove { x: f32, y: f32 },
    /// Mouse button state changed
    MouseButton { button: u32, pressed: bool },
    /// Mouse relative movement
    MouseDelta { dx: f32, dy: f32 },
    /// Keyboard key event
    Key { code: u32, pressed: bool },
}

/// Evdev device information
#[derive(Debug, Clone)]
pub struct EvdevDevice {
    pub path: PathBuf,
    pub name: String,
    pub is_mouse: bool,
    pub is_keyboard: bool,
}

/// Bridge between evdev hardware input and Visual Interaction Bus
pub struct EvdevInputBridge {
    /// Open evdev file descriptors (device_path -> file)
    devices: HashMap<PathBuf, File>,
    /// Current mouse position
    mouse_x: f32,
    mouse_y: f32,
    /// Current button state (bitfield)
    mouse_buttons: u32,
    /// Screen dimensions for coordinate normalization
    screen_width: u32,
    screen_height: u32,
}

impl EvdevInputBridge {
    /// Create a new input bridge
    pub fn new(screen_width: u32, screen_height: u32) -> Self {
        Self {
            devices: HashMap::new(),
            mouse_x: 0.0,
            mouse_y: 0.0,
            mouse_buttons: 0,
            screen_width,
            screen_height,
        }
    }

    /// Discover and open all input devices
    ///
    /// Scans /dev/input/ for event devices and opens them.
    /// Returns the number of devices opened.
    pub fn discover_devices(&mut self) -> std::io::Result<usize> {
        let input_dir = std::fs::read_dir("/dev/input")?;
        let mut count = 0;

        for entry in input_dir {
            let entry = entry?;
            let path = entry.path();

            if let Some(name) = path.file_name() {
                if name.to_string_lossy().starts_with("event") {
                    if self.open_device(&path).is_ok() {
                        count += 1;
                        log::info!("Opened input device: {:?}", path);
                    }
                }
            }
        }

        log::info!("Discovered {} input devices", count);
        Ok(count)
    }

    /// Open a specific input device
    pub fn open_device(&mut self, path: &PathBuf) -> std::io::Result<()> {
        let file = File::open(path)?;
        
        // Set non-blocking mode
        let fd = file.as_raw_fd();
        let flags = unsafe { libc::fcntl(fd, libc::F_GETFL) };
        unsafe { libc::fcntl(fd, libc::F_SETFL, flags | libc::O_NONBLOCK) };

        self.devices.insert(path.clone(), file);
        Ok(())
    }

    /// Poll all devices for new events
    ///
    /// Returns all events since last poll.
    /// Non-blocking - returns immediately if no events.
    pub fn poll(&mut self) -> Vec<InputEvent> {
        let mut events = Vec::new();
        let mut raw_events = Vec::new();

        // First, collect all raw evdev events
        for (_, file) in &mut self.devices {
            let mut buffer = [0u8; std::mem::size_of::<EvdevEvent>()];

            // Read all available events from this device
            loop {
                match file.read_exact(&mut buffer) {
                    Ok(()) => {
                        let ev = unsafe { std::ptr::read(buffer.as_ptr() as *const EvdevEvent) };
                        raw_events.push(ev);
                    }
                    Err(e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                        // No more events from this device
                        break;
                    }
                    Err(e) => {
                        log::warn!("Error reading from device: {}", e);
                        break;
                    }
                }
            }
        }

        // Now process the raw events
        for ev in raw_events {
            if let Some(event) = self.process_evdev_event(&ev) {
                events.push(event);
            }
        }

        events
    }

    /// Process a raw evdev event into an InputEvent
    fn process_evdev_event(&mut self, ev: &EvdevEvent) -> Option<InputEvent> {
        const EV_ABS: u16 = 0x03;   // Absolute coordinates
        const EV_REL: u16 = 0x02;   // Relative movement
        const EV_KEY: u16 = 0x01;   // Key/button events
        const ABS_X: u16 = 0x00;
        const ABS_Y: u16 = 0x01;
        const REL_X: u16 = 0x00;
        const REL_Y: u16 = 0x01;
        const BTN_MOUSE: u16 = 0x110;
        const BTN_LEFT: u16 = 0x110;
        const BTN_RIGHT: u16 = 0x111;
        const BTN_MIDDLE: u16 = 0x112;

        match ev.event_type {
            EV_ABS => {
                match ev.code {
                    ABS_X => {
                        self.mouse_x = self.normalize_x(ev.value);
                        Some(InputEvent::MouseMove { x: self.mouse_x, y: self.mouse_y })
                    }
                    ABS_Y => {
                        self.mouse_y = self.normalize_y(ev.value);
                        Some(InputEvent::MouseMove { x: self.mouse_x, y: self.mouse_y })
                    }
                    _ => None
                }
            }
            EV_REL => {
                match ev.code {
                    REL_X => {
                        self.mouse_x = (self.mouse_x + ev.value as f32).clamp(0.0, self.screen_width as f32);
                        Some(InputEvent::MouseMove { x: self.mouse_x, y: self.mouse_y })
                    }
                    REL_Y => {
                        self.mouse_y = (self.mouse_y + ev.value as f32).clamp(0.0, self.screen_height as f32);
                        Some(InputEvent::MouseMove { x: self.mouse_x, y: self.mouse_y })
                    }
                    _ => None
                }
            }
            EV_KEY => {
                // Mouse buttons
                if ev.code >= BTN_MOUSE && ev.code <= BTN_MIDDLE {
                    let button = ev.code - BTN_MOUSE;
                    if ev.value > 0 {
                        self.mouse_buttons |= 1 << button;
                    } else {
                        self.mouse_buttons &= !(1 << button);
                    }
                    Some(InputEvent::MouseButton {
                        button: button as u32,
                        pressed: ev.value > 0,
                    })
                } else {
                    // Keyboard keys
                    Some(InputEvent::Key {
                        code: ev.code as u32,
                        pressed: ev.value > 0,
                    })
                }
            }
            _ => None
        }
    }

    /// Normalize X coordinate to screen space
    fn normalize_x(&self, value: i32) -> f32 {
        // Most touchpads/mice report 0-65535 range
        (value as f32 / 65535.0 * self.screen_width as f32).clamp(0.0, self.screen_width as f32)
    }

    /// Normalize Y coordinate to screen space
    fn normalize_y(&self, value: i32) -> f32 {
        (value as f32 / 65535.0 * self.screen_height as f32).clamp(0.0, self.screen_height as f32)
    }

    /// Get current input state for Visual Interaction Bus
    ///
    /// This is the main output - converts internal state to the
    /// format expected by the GPU memory layout.
    pub fn get_input_state(&self) -> InputState {
        InputState {
            mouse_x: self.mouse_x,
            mouse_y: self.mouse_y,
            mouse_btn: self.mouse_buttons as f32,
            mouse_dx: 0.0, // Computed by VisualInteractionBus
            mouse_dy: 0.0,
            focused_id: 0.0,
            _padding: [0.0; 10],
        }
    }

    /// Get current mouse position
    pub fn mouse_position(&self) -> (f32, f32) {
        (self.mouse_x, self.mouse_y)
    }

    /// Get current button state
    pub fn button_state(&self) -> u32 {
        self.mouse_buttons
    }

    /// Check if any devices are open
    pub fn has_devices(&self) -> bool {
        !self.devices.is_empty()
    }
}

impl Default for EvdevInputBridge {
    fn default() -> Self {
        Self::new(1920, 1080)
    }
}

/// Simulated input bridge for testing without hardware
///
/// This is used when evdev is not available or for unit tests.
pub struct SimulatedInputBridge {
    state: InputState,
}

impl SimulatedInputBridge {
    pub fn new() -> Self {
        Self {
            state: InputState::default(),
        }
    }

    /// Simulate a mouse move event
    pub fn mouse_move(&mut self, x: f32, y: f32) {
        self.state.mouse_dx = x - self.state.mouse_x;
        self.state.mouse_dy = y - self.state.mouse_y;
        self.state.mouse_x = x;
        self.state.mouse_y = y;
    }

    /// Simulate a mouse button event
    pub fn mouse_button(&mut self, pressed: bool) {
        self.state.mouse_btn = if pressed { 1.0 } else { 0.0 };
    }

    /// Get current input state
    pub fn get_input_state(&self) -> InputState {
        self.state
    }
}

impl Default for SimulatedInputBridge {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simulated_input_bridge() {
        let mut bridge = SimulatedInputBridge::new();
        
        bridge.mouse_move(100.0, 200.0);
        let state = bridge.get_input_state();
        assert_eq!(state.mouse_x, 100.0);
        assert_eq!(state.mouse_y, 200.0);

        bridge.mouse_button(true);
        let state = bridge.get_input_state();
        assert_eq!(state.mouse_btn, 1.0);

        bridge.mouse_button(false);
        let state = bridge.get_input_state();
        assert_eq!(state.mouse_btn, 0.0);
    }

    #[test]
    fn test_input_bridge_creation() {
        let bridge = EvdevInputBridge::new(1920, 1080);
        assert_eq!(bridge.screen_width, 1920);
        assert_eq!(bridge.screen_height, 1080);
        assert!(!bridge.has_devices());
    }

    #[test]
    fn test_normalize_coordinates() {
        let bridge = EvdevInputBridge::new(1920, 1080);
        
        // Full range normalization
        assert!((bridge.normalize_x(0) - 0.0).abs() < 1.0);
        assert!((bridge.normalize_x(65535) - 1920.0).abs() < 1.0);
        assert!((bridge.normalize_y(0) - 0.0).abs() < 1.0);
        assert!((bridge.normalize_y(65535) - 1080.0).abs() < 1.0);
    }
}
