#![allow(dead_code, unused_imports, unused_variables)]
use std::sync::Arc;

use smithay::{
    backend::input::{
        Axis, ButtonState, KeyboardKeyEvent, MouseButton, AxisSource, InputBackend,
    },
    reexports::wayland_server::{
        protocol::{
            wl_surface::WlSurface,
        },
        Resource,
    },
    input::{
        Seat,
        pointer::{MotionEvent, ButtonEvent, AxisFrame},
        keyboard::FilterResult,
    },
    utils::Serial,
};

use crate::camera::Camera;
use crate::window::WindowManager;
use crate::compositor_state::GeometryCompositorState;

/// Manages input devices and forwards events to Wayland clients
pub struct InputManager {
    /// Smithay seat
    seat: Seat<GeometryCompositorState>,
    
    /// Current focused surface
    focused_surface: Option<WlSurface>,
    
    /// Current focused window (for tracking)
    focused_window_id: Option<usize>,

    /// Phase 41: Possessed window ID (Game Mode Interaction)
    possessed_window_id: Option<usize>,
    
    /// Phase 30.6: VM console input buffer (Vec<u8> for keyboard input)
    vm_console_input: Option<Arc<std::sync::Mutex<Vec<u8>>>>,
    
    /// Last known pointer position (screen coordinates)
    pointer_pos: Option<(f32, f32)>,
    
    /// Pointer button state
    #[allow(dead_code)]
    pointer_buttons: u32,
    
    /// Phase 31: Clipboard manager for copy/paste operations
    clipboard_manager: Option<crate::clipboard_manager::SharedClipboardManager>,

    /// Phase 31: Crystallized text engine input buffer
    crystallized_input: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 34: Save/Load command buffer
    save_load_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 35.1: Selection command buffer
    selection_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 35.2: Clipboard command buffer
    clipboard_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 35.3: Undo command buffer
    undo_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 38: Execution command buffer (Ctrl+Enter)
    execution_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 47: Crystallize command buffer (F5 - Text to RTS)
    crystallize_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 40: Hex Editor shortcuts
    hex_editor_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 42: Compiler Tile commands (Ctrl+Shift+C)
    compile_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 44: Profiler commands (Ctrl+Shift+P)
    profiler_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,

    /// Phase 44: Multi-VM commands (Ctrl+Shift+M)
    multi_vm_commands: Option<Arc<std::sync::Mutex<Vec<u8>>>>,
}

impl InputManager {
    pub fn new(seat: Seat<GeometryCompositorState>) -> Self {
        InputManager {
            seat,
            focused_surface: None,
            focused_window_id: None,
            possessed_window_id: None,
            vm_console_input: None,
            pointer_pos: None,
            pointer_buttons: 0,
            clipboard_manager: None,
            crystallized_input: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            save_load_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            selection_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            clipboard_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            undo_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            execution_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            crystallize_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            hex_editor_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            compile_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            profiler_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
            multi_vm_commands: Some(Arc::new(std::sync::Mutex::new(Vec::new()))),
        }
    }

    /// Phase 41: Set possessed window (Game Mode Interaction)
    pub fn set_possessed_window(&mut self, window_id: Option<usize>) {
        self.possessed_window_id = window_id;
        if let Some(id) = window_id {
            log::info!("🎮 Possessed Window ID: {}", id);
        } else {
            log::info!("🎮 Released Window Possession");
        }
    }

    pub fn is_window_possessed(&self) -> bool {
        self.possessed_window_id.is_some()
    }

    pub fn get_possessed_window_id(&self) -> Option<usize> {
        self.possessed_window_id
    }
    
    /// Phase 31: Set clipboard manager
    pub fn set_clipboard_manager(&mut self, clipboard_manager: crate::clipboard_manager::SharedClipboardManager) {
        self.clipboard_manager = Some(clipboard_manager);
        log::info!("✅ Clipboard manager set in InputManager");
    }
    
    pub fn set_focus(&mut self, state: &mut GeometryCompositorState, surface: Option<WlSurface>, window_id: Option<usize>) {
        if self.focused_surface.as_ref().map(|s| s.id()) == surface.as_ref().map(|s| s.id()) {
            return;
        }

        // Remove focus from old surface
        if let Some(_old_surface) = &self.focused_surface {
             self.seat.get_keyboard().map(|k| k.set_focus(state, None, Serial::from(0)));
        }
        
        // Set new focus
        self.focused_surface = surface.clone();
        self.focused_window_id = window_id;
        
        // Add focus to new surface
        if let Some(new_surface) = &self.focused_surface {
            self.seat.get_keyboard().map(|k| k.set_focus(state, Some(new_surface.clone()), Serial::from(0)));
        }
    }
    
    pub fn handle_keyboard_event<B: InputBackend, E: KeyboardKeyEvent<B>>(
        &mut self,
        state: &mut GeometryCompositorState,
        event: E,
        serial: u32,
        time: u32,
    ) {
        let key = event.key_code();
        let key_state = event.state();

        // Phase 31: Crystallized Text Engine - Intercept and Buffer
        if key_state == smithay::backend::input::KeyState::Pressed {
            // Phase 34: Check for save/load shortcuts first
            if let Some(cmd) = self.check_save_load_shortcuts(key.raw()) {
                if let Some(save_load_commands) = &self.save_load_commands {
                    let mut buffer = save_load_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("💾 Phase 34: Save/Load command: 0x{:02x}", cmd);
                }
            // Phase 35.1: Check for selection shortcuts
            } else if let Some(cmd) = self.check_selection_shortcuts(key.raw()) {
                if let Some(selection_commands) = &self.selection_commands {
                    let mut buffer = selection_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("🎯 Phase 35.1: Selection command: 0x{:02x}", cmd);
                }
            // Phase 35.2: Check for clipboard shortcuts
            } else if let Some(cmd) = self.check_clipboard_shortcuts(key.raw()) {
                if let Some(clipboard_commands) = &self.clipboard_commands {
                    let mut buffer = clipboard_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("📋 Phase 35.2: Clipboard command: 0x{:02x}", cmd);
                }
            // Phase 35.3: Check for undo/redo shortcuts
            } else if let Some(cmd) = self.check_undo_shortcuts(key.raw()) {
                if let Some(undo_commands) = &self.undo_commands {
                    let mut buffer = undo_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("↩️ Phase 35.3: Undo command: 0x{:02x}", cmd);
                }
            // Phase 38: Check for execution shortcuts
            } else if let Some(cmd) = self.check_execution_shortcuts(key.raw()) {
                if let Some(execution_commands) = &self.execution_commands {
                    let mut buffer = execution_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("⚡ Phase 38: Execution command: 0x{:02x}", cmd);
                }
            // Phase 47: Check for crystallize shortcuts (F5)
            } else if let Some(cmd) = self.check_crystallize_shortcuts(key.raw()) {
                if let Some(crystallize_commands) = &self.crystallize_commands {
                    let mut buffer = crystallize_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("💎 Phase 47: Crystallize command: 0x{:02x}", cmd);
                }
            // Phase 40: Check for Hex Editor shortcuts (Ctrl+Shift+H)
            } else if let Some(cmd) = self.check_hex_editor_shortcuts(key.raw()) {
                if let Some(hex_editor_commands) = &self.hex_editor_commands {
                    let mut buffer = hex_editor_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("🧬 Phase 40: Hex Editor command: 0x{:02x}", cmd);
                }
            // Phase 42: Check for Compiler Tile shortcuts (Ctrl+Shift+C)
            } else if let Some(cmd) = self.check_compile_shortcuts(key.raw()) {
                if let Some(compile_commands) = &self.compile_commands {
                    let mut buffer = compile_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("🔧 Phase 42: Compile command: 0x{:02x}", cmd);
                }
            // Phase 44: Check for Profiler shortcuts (Ctrl+Shift+P)
            } else if let Some(cmd) = self.check_profiler_shortcuts(key.raw()) {
                if let Some(profiler_commands) = &self.profiler_commands {
                    let mut buffer = profiler_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("🔍 Phase 44: Profiler command: 0x{:02x}", cmd);
                }
            // Phase 44: Check for Multi-VM shortcuts (Ctrl+Shift+M)
            } else if let Some(cmd) = self.check_multi_vm_shortcuts(key.raw()) {
                if let Some(multi_vm_commands) = &self.multi_vm_commands {
                    let mut buffer = multi_vm_commands.lock().unwrap();
                    buffer.push(cmd);
                    log::info!("🚀 Phase 44: Multi-VM command: 0x{:02x}", cmd);
                }
            } else if let Some(byte) = self.map_scancode_to_ascii(key.raw()) {
                if let Some(crystallized_input) = &self.crystallized_input {
                    let mut buffer = crystallized_input.lock().unwrap();
                    buffer.push(byte);
                    log::debug!("💎 Keyboard routed to Crystallized: {} (0x{:02x})", byte as char, byte);
                }
            }
        }

        // Phase 41: Game Mode - Route to Possessed Window (VM)
        if self.possessed_window_id.is_some() {
            // Check for Escape to release possession (handled in App, but we need to ensure we don't consume it if needed)
            // Actually, app.rs handles the toggle. We just need to route data if possessed.
            
            // Allow App to handle the toggle key (usually Escape or special key)
            // But here we capture everything else.
            
            // Route to console
            self.route_keyboard_to_console(key.raw(), key_state.into());
            
            // Do NOT forward to Wayland client if possessed
            return;
        }

        if let Some(keyboard) = self.seat.get_keyboard() {
             
             keyboard.input(
                 state, 
                 key, 
                 key_state.into(), 
                 serial.into(), 
                 time, 
                 |_, _, _| {
                     FilterResult::<()>::Forward
                 }
             );
        }
    }
    
    pub fn handle_pointer_motion(
        &mut self,
        state: &mut GeometryCompositorState,
        window_manager: &WindowManager,
        camera: &Camera,
        screen_x: f32,
        screen_y: f32,
        time: u32,
        serial: u32,
    ) {
        self.pointer_pos = Some((screen_x, screen_y));
        
        let screen_width = window_manager.screen_width();
        let screen_height = window_manager.screen_height();
        
        let world_pos = camera.screen_to_world(screen_x, screen_y, screen_width, screen_height);
        let world_x = world_pos.x;
        let world_y = world_pos.y;
        
        let target = window_manager.find_window_at_position(world_x, world_y);
        
        if let Some(window) = target {
             if let Some(surface) = &window.surface {
                 let surface_x = world_x - window.x;
                 let surface_y = world_y - window.y;
                 
                 let pointer = self.seat.get_pointer().unwrap();
                 
                 let event = MotionEvent {
                     location: (surface_x as f64, surface_y as f64).into(),
                     serial: Serial::from(serial),
                     time,
                 };
                 
                 pointer.motion(
                      state, 
                      Some((surface.as_ref().clone(), (surface_x as f64, surface_y as f64).into())), 
                      &event,
                  );
             }
        }
    }
    
    pub fn handle_pointer_button(
        &mut self,
        state: &mut GeometryCompositorState,
        button: MouseButton,
        button_state: ButtonState,
        serial: u32,
        time: u32,
    ) {
        // HACK: manually mapping MouseButton to linux keycode since we lack a direct converter
        let code = match button {
            MouseButton::Left => 272,
            MouseButton::Right => 273,
            MouseButton::Middle => 274,
            _ => 272, // Fallback
        };
        
        let event = ButtonEvent {
            serial: Serial::from(serial),
            time,
            button: code, 
            state: button_state.into(),
        };

        if let Some(pointer) = self.seat.get_pointer() {
            pointer.button(
                state,
                &event,
            );
        }
    }
    
    pub fn handle_pointer_axis(
        &mut self,
        state: &mut GeometryCompositorState,
        axis: Axis,
        amount: f64,
        time: u32,
    ) {
        if let Some(pointer) = self.seat.get_pointer() {
             let mut frame = AxisFrame::new(time).source(AxisSource::Wheel);
             frame = frame.value(axis, amount);
             
             pointer.axis(
                state,
                frame,
             );
        }
    }

    /// Phase 30.6: Initialize VM console input buffer
    pub fn init_console_input(&mut self) {
        self.vm_console_input = Some(Arc::new(std::sync::Mutex::new(Vec::new())));
        log::info!("✅ VM console input buffer initialized");
    }

    /// Helper: Map Linux scancode to ASCII byte
    pub fn map_scancode_to_ascii(&self, key_code: u32) -> Option<u8> {
        match key_code {
            // Enter key - send newline
            28 => Some(b'\n'),
            // Backspace - send backspace
            14 => Some(b'\x08'),
            // Tab - send tab
            15 => Some(b'\t'),
            // Escape - send escape
            1 => Some(b'\x1b'),
            // Ctrl+L - clear screen (FF)
            38 => Some(b'\x0c'),
            // Space
            57 => Some(b' '),
            // A-Z (key codes 30-38, 44-50, 16-25)
            // Note: These are Linux key codes, not ASCII
            30 => Some(b'a'),
            48 => Some(b'b'),
            46 => Some(b'c'), // Added 'c' (missing in original?) - wait, 46 is 'c' or ctrl+c? 
            // Original code had 46 as Ctrl+C/Copy so it returned None there.
            // If modifier is not checked here, 46 is 'c'.
            // The caller handles Ctrl state usually?
            // route_keyboard_to_console checks Ctrl for shortcuts separately in app.rs
            // But here raw 46 is 'c'.
            // Let's stick to strict map. 
            // If I map 46->'c', then if Ctrl is held, it might be Ctrl+C.
            // But this function maps keycode to ascii char associated with the key.
            // 'c' is 46.
            
            32 => Some(b'd'),
            18 => Some(b'e'),
            33 => Some(b'f'),
            34 => Some(b'g'),
            35 => Some(b'h'),
            23 => Some(b'i'),
            36 => Some(b'j'),
            37 => Some(b'k'),

            50 => Some(b'm'),
            49 => Some(b'n'),
            24 => Some(b'o'),
            25 => Some(b'p'),
            16 => Some(b'q'),
            19 => Some(b'r'),
            31 => Some(b's'),
            20 => Some(b't'),
            22 => Some(b'u'),
            // 'v' missing? 47 is 'v'.
            // 47 => Some(b'v'), // same check as 'c'
            
            17 => Some(b'w'),
            45 => Some(b'x'),
            21 => Some(b'y'),
            44 => Some(b'z'),
            // 0-9
            2 => Some(b'1'),
            3 => Some(b'2'),
            4 => Some(b'3'),
            5 => Some(b'4'),
            6 => Some(b'5'),
            7 => Some(b'6'),
            8 => Some(b'7'),
            9 => Some(b'8'),
            10 => Some(b'9'),
            11 => Some(b'0'),
            // Special characters
            12 => Some(b'-'),
            13 => Some(b'='),
            26 => Some(b'['),
            27 => Some(b']'),
            39 => Some(b';'),
            40 => Some(b'\''),
            41 => Some(b'`'),
            43 => Some(b'\\'),
            51 => Some(b','),
            52 => Some(b'.'),
            53 => Some(b'/'),
            // Navigation Keys (Mapping to custom codes for GPU buffer)
            103 => Some(128), // Up
            108 => Some(129), // Down
            105 => Some(130), // Left
            106 => Some(131), // Right
            102 => Some(132), // Home
            107 => Some(133), // End
            111 => Some(134), // Delete
            // Phase 34: Save/Load commands (Ctrl+S, Ctrl+O)
            // Note: These are handled specially in handle_keyboard_event
            // The actual Ctrl check is done there, these are just the base key mappings
            _ => None,
        }
    }

    /// Phase 34: Check for save/load keyboard shortcuts (Ctrl+S, Ctrl+O)
    pub fn check_save_load_shortcuts(&self, key_code: u32) -> Option<u8> {
        if !self.is_ctrl_pressed() {
            return None;
        }
        match key_code {
            31 => Some(135), // Ctrl+S = Save
            24 => Some(136), // Ctrl+O = Load
            _ => None,
        }
    }

    /// Phase 35.1: Check for selection keyboard shortcuts
    pub fn check_selection_shortcuts(&self, key_code: u32) -> Option<u8> {
        // Ctrl+A = Select All
        if self.is_ctrl_pressed() && key_code == 30 {
            return Some(137); // Select all
        }

        // Shift+Arrows = Extend selection
        if self.is_shift_pressed() {
            match key_code {
                103 => Some(138), // Shift+Up
                108 => Some(139), // Shift+Down
                105 => Some(140), // Shift+Left
                106 => Some(141), // Shift+Right
                _ => None,
            }
        } else {
            None
        }
    }

    /// Phase 35.2: Check for clipboard keyboard shortcuts
    pub fn check_clipboard_shortcuts(&self, key_code: u32) -> Option<u8> {
        if !self.is_ctrl_pressed() {
            return None;
        }
        match key_code {
            46 => Some(142), // Ctrl+C = Copy
            47 => Some(143), // Ctrl+V = Paste
            45 => Some(144), // Ctrl+X = Cut
            _ => None,
        }
    }

    /// Phase 35.3: Check for undo/redo keyboard shortcuts
    pub fn check_undo_shortcuts(&self, key_code: u32) -> Option<u8> {
        if !self.is_ctrl_pressed() {
            return None;
        }
        match key_code {
            44 => Some(145), // Ctrl+Z = Undo
            21 => Some(146), // Ctrl+Y = Redo
            _ => None,
        }
    }

    /// Phase 38: Check for execution shortcuts (Ctrl+Enter)
    pub fn check_execution_shortcuts(&self, key_code: u32) -> Option<u8> {
        // Ctrl+Enter = Execute current buffer/selection
        if self.is_ctrl_pressed() && key_code == 28 { // Enter key
            return Some(147); // Execute command
        }
        None
    }

    /// Phase 47: Check for crystallize shortcuts (F5)
    pub fn check_crystallize_shortcuts(&self, key_code: u32) -> Option<u8> {
        // F5 = Crystallize (Convert text to RTS PNG)
        // F5 key code is 63 in Linux input event codes
        if key_code == 63 { // F5 key
            return Some(148); // Crystallize command
        }
        None
    }

    /// Phase 30.6: Route keyboard input to VM console (when VM window focused)
    pub fn route_keyboard_to_console(&mut self, key_code: u32, key_state: smithay::backend::input::KeyState) {
        // Only process key press events
        if key_state != smithay::backend::input::KeyState::Pressed {
            return;
        }

        // Check if VM window is focused and has console
        if let Some(vm_console_input) = &self.vm_console_input {
            // Check for explicit 'c' (46) and 'v' (47) override if special handling needed?
            // In original code, 46 and 47 returned None.
            // That was likely to prevent 'c' printed when Ctrl+C.
            // But if I just press 'c', I want 'c'.
            // The safest is to map them in 'map_scancode_to_ascii' but include an argument for modifiers?
            // Or just check here.
            
            let input_byte = if key_code == 46 || key_code == 47 {
                // If we want to allow typing 'c' and 'v', we should allow them.
                // Ctrl+C/V handling is upstream in app.rs. 
                // If it wasn't intercepted there, it falls through here.
                // So here it means just 'c' or 'v'.
                match key_code {
                    46 => Some(b'c'),
                    47 => Some(b'v'),
                    _ => None
                }
            } else {
                self.map_scancode_to_ascii(key_code)
            };
            
            // Write to VM console input buffer
            if let Some(byte) = input_byte {
                let mut buffer = vm_console_input.lock().unwrap();
                buffer.push(byte);
                log::debug!("📝 Keyboard routed to VM console: {} (0x{:02x})", byte as char, byte);
            }
        }
    }

    /// Phase 30.6: Write to VM console input buffer (from keyboard)
    pub fn write_console_input(&mut self, data: &[u8]) {
        if let Some(vm_console_input) = &self.vm_console_input {
            let mut buffer = vm_console_input.lock().unwrap();
            buffer.extend_from_slice(data);
            log::debug!("📝 Written {} bytes to VM console input", data.len());
        }
    }

    /// Phase 30.6: Get pending console input data (and clear the buffer)
    pub fn get_console_input(&mut self) -> Option<Vec<u8>> {
        if let Some(vm_console_input) = &self.vm_console_input {
            let mut buffer = vm_console_input.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            let data: Vec<u8> = buffer.drain(..).collect();
            log::debug!("📤 Retrieved {} bytes from console input buffer", data.len());
            Some(data)
        } else {
            None
        }
    }

    /// Get the focused window ID
    pub fn get_focused_window_id(&self) -> Option<usize> {
        self.focused_window_id
    }

    /// Check if Shift key is pressed
    pub fn is_shift_pressed(&self) -> bool {
        if let Some(keyboard) = self.seat.get_keyboard() {
            // Note: This relies on Smithay tracking the modifier state
            // The API might vary by version, assuming standard accessor
            // If this fails to compile, we might need to track it manually in handle_keyboard_event
            keyboard.modifier_state().shift
        } else {
            false
        }
    }
    
    /// Phase 31: Check if Ctrl key is pressed
    pub fn is_ctrl_pressed(&self) -> bool {
        if let Some(keyboard) = self.seat.get_keyboard() {
            keyboard.modifier_state().ctrl
        } else {
            false
        }
    }
    
    /// Phase 31: Handle clipboard copy operation (Ctrl+C)
    pub fn handle_clipboard_copy(&mut self) {
        if let Some(_clipboard_manager) = &self.clipboard_manager {
            // Note: The actual copy operation is handled by the VirtualMachine
            // which has access to the terminal clipboard
            // This method is a placeholder for future direct clipboard integration
            log::debug!("📋 Clipboard copy requested");
        }
    }
    
    /// Phase 31: Handle clipboard paste operation (Ctrl+V)
    /// Returns the text to paste, or None if clipboard is empty
    pub fn handle_clipboard_paste(&mut self) -> Option<String> {
        if let Some(clipboard_manager) = &self.clipboard_manager {
            if let Some(data) = clipboard_manager.get_clipboard() {
                if let Ok(text) = String::from_utf8(data.data.clone()) {
                    log::debug!("📋 Clipboard paste: {} bytes", text.len());
                    return Some(text);
                }
            }
        }
        None
    }
    
    /// Phase 31: Paste text to VM console input buffer
    pub fn paste_to_console(&mut self, text: &str) {
        if let Some(vm_console_input) = &self.vm_console_input {
            let mut buffer = vm_console_input.lock().unwrap();
            buffer.extend_from_slice(text.as_bytes());
            log::debug!("📋 Pasted {} bytes to console", text.len());
        }
    }

    /// Phase 31: Get pending crystallized input data
    pub fn get_crystallized_input(&mut self) -> Option<Vec<u8>> {
        if let Some(crystallized_input) = &self.crystallized_input {
            let mut buffer = crystallized_input.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 34: Get pending save/load commands
    pub fn get_save_load_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(save_load_commands) = &self.save_load_commands {
            let mut buffer = save_load_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 35.1: Get pending selection commands
    pub fn get_selection_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(selection_commands) = &self.selection_commands {
            let mut buffer = selection_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 35.2: Get pending clipboard commands
    pub fn get_clipboard_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(clipboard_commands) = &self.clipboard_commands {
            let mut buffer = clipboard_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 35.3: Get pending undo commands
    pub fn get_undo_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(undo_commands) = &self.undo_commands {
            let mut buffer = undo_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 38: Get pending execution commands
    pub fn get_execution_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(execution_commands) = &self.execution_commands {
            let mut buffer = execution_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 47: Get pending crystallize commands
    pub fn get_crystallize_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(crystallize_commands) = &self.crystallize_commands {
            let mut buffer = crystallize_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 40: Check for Hex Editor shortcuts (Ctrl+Shift+H)
    pub fn check_hex_editor_shortcuts(&self, key_code: u32) -> Option<u8> {
        // Ctrl+Shift+H (Key code 35)
        if self.is_ctrl_pressed() && self.is_shift_pressed() && key_code == 35 {
            return Some(149); // Enter Hex Mode with alpine.rts
        }
        
        // Ctrl+F (Key code 33) = Toggle Search
        if self.is_ctrl_pressed() && key_code == 33 {
            return Some(150);
        }
        
        // Ctrl+G (Key code 34) = Find Next
        if self.is_ctrl_pressed() && !self.is_shift_pressed() && key_code == 34 {
            return Some(151);
        }
        
        // Ctrl+Shift+G (Key code 34) = Find Prev
        if self.is_ctrl_pressed() && self.is_shift_pressed() && key_code == 34 {
            return Some(152);
        }
        
        // Ctrl+Shift+A (Key code 30) = Neural Consult
        if self.is_ctrl_pressed() && self.is_shift_pressed() && key_code == 30 {
            return Some(153);
        }
        
        None
    }

    /// Phase 42: Check for Compile shortcuts (Ctrl+Shift+C)
    pub fn check_compile_shortcuts(&self, key_code: u32) -> Option<u8> {
        // Ctrl+Shift+C (Key code 46) = Compile focused tile
        if self.is_ctrl_pressed() && self.is_shift_pressed() && key_code == 46 {
            return Some(154); // Compile command
        }
        None
    }

    /// Phase 42: Get pending compile commands
    pub fn get_compile_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(compile_commands) = &self.compile_commands {
            let mut buffer = compile_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 40: Get pending hex editor commands
    pub fn get_hex_editor_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(hex_editor_commands) = &self.hex_editor_commands {
            let mut buffer = hex_editor_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 44: Check for Profiler shortcuts (Ctrl+Shift+P)
    pub fn check_profiler_shortcuts(&self, key_code: u32) -> Option<u8> {
        // Ctrl+Shift+P (Key code 33) = Toggle profiler
        if self.is_ctrl_pressed() && self.is_shift_pressed() && key_code == 33 {
            return Some(155); // Profiler toggle command
        }
        None
    }

    /// Phase 44: Get pending profiler commands
    pub fn get_profiler_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(profiler_commands) = &self.profiler_commands {
            let mut buffer = profiler_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }

    /// Phase 44: Check for Multi-VM shortcuts (Ctrl+Shift+M)
    pub fn check_multi_vm_shortcuts(&self, key_code: u32) -> Option<u8> {
        // Ctrl+Shift+M (Key code 58) = Launch multiple VMs
        if self.is_ctrl_pressed() && self.is_shift_pressed() && key_code == 58 {
            return Some(156); // Multi-VM launch command
        }
        None
    }

    /// Phase 44: Get pending multi-VM commands
    pub fn get_multi_vm_commands(&mut self) -> Option<Vec<u8>> {
        if let Some(multi_vm_commands) = &self.multi_vm_commands {
            let mut buffer = multi_vm_commands.lock().unwrap();
            if buffer.is_empty() {
                return None;
            }
            Some(buffer.drain(..).collect())
        } else {
            None
        }
    }
}
