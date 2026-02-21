use crate::window::{WindowManager, WindowType};
use crate::vm_texture_manager::VmTextureManager;
use crate::terminal_emulator::{TerminalBuffer, TerminalColor, CellAttributes};

pub struct IntrospectionWindow {
    pub window_id: usize,
    pub buffer: TerminalBuffer,
}

impl IntrospectionWindow {
    pub fn new(
        window_manager: &mut WindowManager,
        x: f32,
        y: f32,
        analysis_text: &str
    ) -> Self {
        // Create a dedicated window for introspection
        // We use "System" type for green/stable look
        // Content is initially empty string as we use VmTexture
        let window_id = window_manager.create_demo_window(
            "Synaptic Analysis".to_string(), 
            String::new(), 
            x, y, 
            WindowType::System
        );

        // Resize window to fit text (approx 80 chars x 24 lines)
        if let Some(window) = window_manager.get_window_mut(window_id) {
            window.width = 800.0;
            window.height = 600.0;
            window.has_vm_texture = true; // IMPORTANT: Tell renderer to use texture
        }

        // Initialize Terminal Buffer (100 cols x 37 rows approx for 800x600 with 16px font)
        let rows = (600 / 16) as usize;
        let cols = (800 / 8) as usize;
        let mut buffer = TerminalBuffer::new(rows, cols);

        // Write content to buffer
        Self::write_content(&mut buffer, analysis_text);

        IntrospectionWindow {
            window_id,
            buffer,
        }
    }

    fn write_content(buffer: &mut TerminalBuffer, text: &str) {
        buffer.clear_screen();
        
        // Define styles
        let mut normal = CellAttributes::default();
        normal.fg = TerminalColor::Green; // Matrix style
        
        let mut header = CellAttributes::default();
        header.fg = TerminalColor::BrightWhite;
        header.bold = true;

        let mut label = CellAttributes::default();
        label.fg = TerminalColor::Cyan;

        let mut warning = CellAttributes::default();
        warning.fg = TerminalColor::Red;

        // Parse and write
        for line in text.lines() {
            let attrs = if line.starts_with("LABEL:") {
                header
            } else if line.contains("Entropy: 6") || line.contains("Entropy: 7") {
                warning // High entropy
            } else if line.starts_with("🔍") {
                label
            } else {
                normal
            };

            for char in line.chars() {
                buffer.write_char(char, attrs);
            }
            // Newline
            let (r, c) = buffer.get_cursor();
            buffer.move_cursor(r + 1, 0);
        }
    }

    pub fn update_texture(&self, texture_manager: &mut VmTextureManager) {
        // Render buffer to texture
        // No cursor, no selection
        if let Err(e) = texture_manager.update_terminal_texture(
            self.window_id, 
            &self.buffer, 
            false, 
            0.0, 
            None
        ) {
            log::error!("Failed to update introspection window texture: {}", e);
        }
    }
}
