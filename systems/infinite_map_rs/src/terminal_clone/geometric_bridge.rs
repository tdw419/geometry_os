//! Geometric Terminal Bridge - PixelRTS v3 Integration
//!
//! Connects the Terminal Clone system with PixelRTS v3 geometric instructions.
//! Each terminal cell is encoded as an RGBA pixel that the GPU can directly execute.
//!
//! Encoding (RGBA):
//!   R (Char):   ASCII character code (0-127)
//!   G (FG):     Foreground color index (0-15)
//!   B (BG):     Background color index (0-15)
//!   A (Flags):  Style flags (bold=1, dim=2, italic=4, underline=8, blink=16, inverse=32)

use std::collections::HashMap;

/// Terminal cell encoded as RGBA pixel for GPU-native rendering
#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
pub struct GeometricCell {
    pub char: u8,  // ASCII code (R channel)
    pub fg: u8,    // Foreground color (G channel)
    pub bg: u8,    // Background color (B channel)
    pub flags: u8, // Style flags (A channel)
}

impl GeometricCell {
    /// Create a new geometric cell
    pub fn new(char: u8, fg: u8, bg: u8, flags: u8) -> Self {
        Self {
            char,
            fg: fg & 0xF,
            bg: bg & 0xF,
            flags,
        }
    }

    /// Encode as u32 for GPU buffer
    pub fn to_u32(&self) -> u32 {
        ((self.char as u32) << 24)
            | ((self.fg as u32) << 16)
            | ((self.bg as u32) << 8)
            | (self.flags as u32)
    }

    /// Decode from u32
    pub fn from_u32(val: u32) -> Self {
        Self {
            char: ((val >> 24) & 0xFF) as u8,
            fg: ((val >> 16) & 0xFF) as u8,
            bg: ((val >> 8) & 0xFF) as u8,
            flags: (val & 0xFF) as u8,
        }
    }

    /// Check if cell has content
    pub fn is_empty(&self) -> bool {
        self.char == 0 || self.char == b' '
    }
}

/// Style flags for terminal cells
pub mod flags {
    pub const BOLD: u8 = 1;
    pub const DIM: u8 = 2;
    pub const ITALIC: u8 = 4;
    pub const UNDERLINE: u8 = 8;
    pub const BLINK: u8 = 16;
    pub const INVERSE: u8 = 32;
}

/// Standard 16-color terminal palette as RGB values
pub const TERMINAL_PALETTE: [[f32; 4]; 16] = [
    [0.0, 0.0, 0.0, 1.0],    // 0: Black
    [0.76, 0.21, 0.13, 1.0], // 1: Red
    [0.15, 0.74, 0.14, 1.0], // 2: Green
    [0.68, 0.68, 0.15, 1.0], // 3: Yellow
    [0.29, 0.18, 0.88, 1.0], // 4: Blue
    [0.83, 0.22, 0.83, 1.0], // 5: Magenta
    [0.20, 0.73, 0.78, 1.0], // 6: Cyan
    [0.80, 0.80, 0.80, 1.0], // 7: White
    [0.50, 0.50, 0.50, 1.0], // 8: Bright Black
    [1.00, 0.00, 0.00, 1.0], // 9: Bright Red
    [0.00, 1.00, 0.00, 1.0], // 10: Bright Green
    [1.00, 1.00, 0.00, 1.0], // 11: Bright Yellow
    [0.37, 0.51, 0.95, 1.0], // 12: Bright Blue
    [1.00, 0.00, 1.00, 1.0], // 13: Bright Magenta
    [0.00, 1.00, 1.00, 1.0], // 14: Bright Cyan
    [1.00, 1.00, 1.00, 1.0], // 15: Bright White
];

/// Geometric terminal buffer for PixelRTS v3 rendering
pub struct GeometricTerminalBuffer {
    pub cols: usize,
    pub rows: usize,
    pub cells: Vec<GeometricCell>,
    pub cursor_x: usize,
    pub cursor_y: usize,
    pub current_fg: u8,
    pub current_bg: u8,
    pub current_flags: u8,
}

impl GeometricTerminalBuffer {
    /// Create a new geometric terminal buffer
    pub fn new(cols: usize, rows: usize) -> Self {
        Self {
            cols,
            rows,
            cells: vec![GeometricCell::default(); cols * rows],
            cursor_x: 0,
            cursor_y: 0,
            current_fg: 7, // Default white
            current_bg: 0, // Default black
            current_flags: 0,
        }
    }

    /// Put a character at the current cursor position
    pub fn putc(&mut self, c: u8) {
        if self.cursor_y < self.rows && self.cursor_x < self.cols {
            let idx = self.cursor_y * self.cols + self.cursor_x;
            self.cells[idx] =
                GeometricCell::new(c, self.current_fg, self.current_bg, self.current_flags);

            // Advance cursor
            self.cursor_x += 1;
            if self.cursor_x >= self.cols {
                self.cursor_x = 0;
                self.advance_row();
            }
        }
    }

    /// Process PTY output bytes
    pub fn process_pty_output(&mut self, data: &[u8]) {
        for &byte in data {
            match byte {
                b'\n' => {
                    self.cursor_x = 0;
                    self.advance_row();
                }
                b'\r' => {
                    self.cursor_x = 0;
                }
                b'\t' => {
                    self.cursor_x = (self.cursor_x + 8) & !7;
                    if self.cursor_x >= self.cols {
                        self.cursor_x = 0;
                        self.advance_row();
                    }
                }
                0x1b => {
                    // ESC - would need ANSI parser for full support
                    // For now, just skip
                }
                c if c >= 32 => {
                    self.putc(c);
                }
                _ => {} // Ignore other control characters
            }
        }
    }

    /// Advance to next row, scrolling if necessary
    fn advance_row(&mut self) {
        self.cursor_y += 1;
        if self.cursor_y >= self.rows {
            self.scroll(1);
            self.cursor_y = self.rows - 1;
        }
    }

    /// Scroll the buffer by N lines
    pub fn scroll(&mut self, lines: usize) {
        for _ in 0..lines {
            // Shift cells up
            self.cells.drain(0..self.cols);
            self.cells
                .extend(std::iter::repeat_with(GeometricCell::default).take(self.cols));
        }
    }

    /// Clear the buffer
    pub fn clear(&mut self) {
        for cell in &mut self.cells {
            *cell = GeometricCell::default();
        }
        self.cursor_x = 0;
        self.cursor_y = 0;
    }

    /// Get the buffer as u32 array for GPU
    pub fn to_gpu_buffer(&self) -> Vec<u32> {
        self.cells.iter().map(|c| c.to_u32()).collect()
    }

    /// Generate PASM instructions for a string of text
    pub fn generate_pasm(&self, text: &str) -> Vec<[u8; 4]> {
        let mut instructions = Vec::new();
        for c in text.chars() {
            // PUTC opcode (0x40), G=char, B=fg, A=flags (or metadata)
            // Note: In our v3 PASM, PUTC takes char from register or immediate.
            // For this bridge, we'll pack them into pixels directly.
            let pixel = [0x40, c as u8, self.current_fg, self.current_flags];
            instructions.push(pixel);
        }
        instructions
    }

    /// Write a notification line with timestamp prefix
    ///
    /// Format: [HH:MM:SS] Message
    /// Uses bright colors and bold for visibility
    pub fn write_notification(&mut self, message: &str, fg_color: u8) {
        let timestamp = Self::get_timestamp();
        self.cursor_x = 0;

        let saved_fg = self.current_fg;
        let saved_flags = self.current_flags;

        // Write timestamp in dim gray
        self.current_fg = 8; // Bright black (dim gray)
        self.current_flags = 0;
        for c in format!("[{}] ", timestamp).chars() {
            if c.is_ascii() {
                self.putc(c as u8);
            }
        }

        // Write message in specified color with bold
        self.current_fg = fg_color;
        self.current_flags = flags::BOLD;
        for c in message.chars() {
            if c.is_ascii() {
                self.putc(c as u8);
            }
        }

        // Restore colors and advance to next line
        self.current_fg = saved_fg;
        self.current_flags = saved_flags;
        self.cursor_x = 0;
        if self.cursor_y + 1 < self.rows {
            self.cursor_y += 1;
        } else {
            self.scroll(1);
        }
    }

    /// Write notification with explicit timestamp (for testing)
    pub fn write_notification_with_time(&mut self, message: &str, timestamp: &str, fg_color: u8) {
        self.cursor_x = 0;

        let saved_fg = self.current_fg;
        let saved_flags = self.current_flags;

        // Timestamp in dim gray
        self.current_fg = 8;
        self.current_flags = 0;
        for c in format!("[{}] ", timestamp).chars() {
            if c.is_ascii() {
                self.putc(c as u8);
            }
        }

        // Message in specified color with bold
        self.current_fg = fg_color;
        self.current_flags = flags::BOLD;
        for c in message.chars() {
            if c.is_ascii() {
                self.putc(c as u8);
            }
        }

        self.current_fg = saved_fg;
        self.current_flags = saved_flags;
        self.cursor_x = 0;
        if self.cursor_y + 1 < self.rows {
            self.cursor_y += 1;
        } else {
            self.scroll(1);
        }
    }

    /// Get current timestamp as HH:MM:SS
    fn get_timestamp() -> String {
        use std::time::{SystemTime, UNIX_EPOCH};

        let duration = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap_or_default();
        let total_secs = duration.as_secs();
        let hours = (total_secs / 3600) % 24;
        let mins = (total_secs / 60) % 60;
        let secs = total_secs % 60;

        format!("{:02}:{:02}:{:02}", hours, mins, secs)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_geometric_cell_encoding() {
        let cell = GeometricCell::new(b'H', 10, 0, flags::BOLD);
        let encoded = cell.to_u32();
        let decoded = GeometricCell::from_u32(encoded);

        assert_eq!(cell.char, decoded.char);
        assert_eq!(cell.fg, decoded.fg);
        assert_eq!(cell.bg, decoded.bg);
        assert_eq!(cell.flags, decoded.flags);
    }

    #[test]
    fn test_terminal_buffer_basic() {
        let mut buf = GeometricTerminalBuffer::new(80, 24);

        buf.process_pty_output(b"Hello");

        assert_eq!(buf.cells[0].char, b'H');
        assert_eq!(buf.cells[4].char, b'o');
        assert_eq!(buf.cursor_x, 5);
        assert_eq!(buf.cursor_y, 0);
    }

    #[test]
    fn test_terminal_buffer_newline() {
        let mut buf = GeometricTerminalBuffer::new(10, 5);

        buf.process_pty_output(b"Line1\nLine2");

        assert_eq!(buf.cells[0].char, b'L');
        assert_eq!(buf.cells[10].char, b'L'); // Start of second line
        assert_eq!(buf.cursor_y, 1);
    }

    #[test]
    fn test_terminal_buffer_scroll() {
        let mut buf = GeometricTerminalBuffer::new(10, 3);

        buf.process_pty_output(b"Line1\nLine2\nLine3\nLine4");

        // After 4 lines in a 3-row buffer, first line should be scrolled off
        assert_eq!(buf.cells[0].char, b'L'); // Line2
        assert_eq!(buf.cells[10].char, b'L'); // Line3
        assert_eq!(buf.cells[20].char, b'L'); // Line4
    }

    #[test]
    fn test_write_notification_single_line() {
        let mut buf = GeometricTerminalBuffer::new(80, 24);

        buf.write_notification("Test Event", 11); // Bright yellow

        // Should start with timestamp bracket
        assert_eq!(buf.cells[0].char, b'[');
        assert_eq!(buf.cells[0].fg, 8); // Dim gray for timestamp

        // Cursor should have advanced to next line
        assert_eq!(buf.cursor_y, 1);
    }

    #[test]
    fn test_write_notification_with_timestamp() {
        let mut buf = GeometricTerminalBuffer::new(80, 24);

        buf.write_notification_with_time("Evolution Complete", "14:32:05", 10);

        // Timestamp prefix
        assert_eq!(buf.cells[0].char, b'[');
        assert_eq!(buf.cells[1].char, b'1');
        assert_eq!(buf.cells[2].char, b'4');

        // "Evolution" starts after "[14:32:05] " (11 chars)
        assert_eq!(buf.cells[11].char, b'E');
        assert_eq!(buf.cells[11].fg, 10); // Bright green
        assert_eq!(buf.cells[11].flags, flags::BOLD);
    }
}
