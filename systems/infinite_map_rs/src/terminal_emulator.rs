// Phase 30.7: Terminal Emulation (VT100/ANSI Support)
//
// This module implements a state-aware terminal emulator that interprets
// ANSI/VT100 escape sequences from the guest VM and maintains a virtual
// screen buffer that can be rendered by the Geometry OS compositor.
//
// Architecture:
// - Guest Kernel -> VirtIO Console -> TerminalEmulator -> Virtual Screen Buffer
// - ANSI escape sequences are parsed and converted to cell attributes
// - Terminal colors are mapped to Geometry OS Neons
// - Advanced input (arrows, F-keys) are mapped to ANSI sequences

#[cfg(feature = "hypervisor")]
use vte::{Parser, Perform};

#[cfg(feature = "hypervisor")]
use vte::Params;

/// Terminal Color (8-bit color palette)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub enum TerminalColor {
    #[default]
    Black,
    Red,
    Green,
    Yellow,
    Blue,
    Magenta,
    Cyan,
    White,
    BrightBlack,
    BrightRed,
    BrightGreen,
    BrightYellow,
    BrightBlue,
    BrightMagenta,
    BrightCyan,
    BrightWhite,
    Rgb(u8, u8, u8), // 24-bit RGB color
    Indexed(u8),     // 256-color palette
}

impl TerminalColor {
    /// Convert terminal color to RGBA (for rendering)
    pub fn to_rgba(&self) -> [u8; 4] {
        match self {
            TerminalColor::Black => [0, 0, 0, 255],
            TerminalColor::Red => [194, 54, 33, 255],
            TerminalColor::Green => [37, 188, 36, 255],
            TerminalColor::Yellow => [173, 173, 39, 255],
            TerminalColor::Blue => [73, 46, 225, 255],
            TerminalColor::Magenta => [211, 56, 211, 255],
            TerminalColor::Cyan => [51, 187, 200, 255],
            TerminalColor::White => [203, 204, 205, 255],
            TerminalColor::BrightBlack => [128, 128, 128, 255],
            TerminalColor::BrightRed => [255, 0, 0, 255],
            TerminalColor::BrightGreen => [0, 255, 0, 255],
            TerminalColor::BrightYellow => [255, 255, 0, 255],
            TerminalColor::BrightBlue => [94, 129, 242, 255],
            TerminalColor::BrightMagenta => [255, 0, 255, 255],
            TerminalColor::BrightCyan => [0, 255, 255, 255],
            TerminalColor::BrightWhite => [255, 255, 255, 255],
            TerminalColor::Rgb(r, g, b) => [*r, *g, *b, 255],
            TerminalColor::Indexed(idx) => {
                // Simplified 256-color palette (could be expanded)
                let palette = [
                    [0, 0, 0],
                    [128, 0, 0],
                    [0, 128, 0],
                    [128, 128, 0],
                    [0, 0, 128],
                    [128, 0, 128],
                    [0, 128, 128],
                    [192, 192, 192],
                    [128, 128, 128],
                    [255, 0, 0],
                    [0, 255, 0],
                    [255, 255, 0],
                    [0, 0, 255],
                    [255, 0, 255],
                    [0, 255, 255],
                    [255, 255, 255],
                ];
                if (*idx as usize) < palette.len() {
                    [
                        palette[*idx as usize][0],
                        palette[*idx as usize][1],
                        palette[*idx as usize][2],
                        255,
                    ]
                } else {
                    [128, 128, 128, 255]
                }
            }
        }
    }

    /// Map terminal color to Geometry OS Neon (for neural state visualization)
    pub fn to_neon(&self) -> f32 {
        // Map terminal colors to neon intensity (0.0 - 1.0)
        // Red -> High Entropy (Error/Critical)
        // Green -> Low Entropy (Stable/Growth)
        // Blue -> Reasoning (Logic)
        match self {
            TerminalColor::Red | TerminalColor::BrightRed => 0.95, // High entropy
            TerminalColor::Green | TerminalColor::BrightGreen => 0.15, // Low entropy
            TerminalColor::Blue | TerminalColor::BrightBlue => 0.50, // Mid entropy
            TerminalColor::Yellow | TerminalColor::BrightYellow => 0.70, // Warning
            TerminalColor::Magenta | TerminalColor::BrightMagenta => 0.80, // Creative
            TerminalColor::Cyan | TerminalColor::BrightCyan => 0.35, // Info
            _ => 0.20,                                             // Default
        }
    }

    /// Convert color to 16-color index for shader
    pub fn to_indexed(&self) -> u8 {
        match self {
            TerminalColor::Black => 0,
            TerminalColor::Red => 1,
            TerminalColor::Green => 2,
            TerminalColor::Yellow => 3,
            TerminalColor::Blue => 4,
            TerminalColor::Magenta => 5,
            TerminalColor::Cyan => 6,
            TerminalColor::White => 7,
            TerminalColor::BrightBlack => 8,
            TerminalColor::BrightRed => 9,
            TerminalColor::BrightGreen => 10,
            TerminalColor::BrightYellow => 11,
            TerminalColor::BrightBlue => 12,
            TerminalColor::BrightMagenta => 13,
            TerminalColor::BrightCyan => 14,
            TerminalColor::BrightWhite => 15,
            TerminalColor::Rgb(_, _, _) => 7, // Fallback to white for now
            TerminalColor::Indexed(idx) => *idx % 16,
        }
    }
}

/// Terminal Cell Attributes
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct CellAttributes {
    /// Foreground color
    pub fg: TerminalColor,
    /// Background color
    pub bg: TerminalColor,
    /// Bold text
    pub bold: bool,
    /// Dim text
    pub dim: bool,
    /// Italic text
    pub italic: bool,
    /// Underline text
    pub underline: bool,
    /// Blink text
    pub blink: bool,
    /// Inverse colors
    pub inverse: bool,
    /// Hidden text
    pub hidden: bool,
    /// Strikethrough text
    pub strikethrough: bool,
}

impl CellAttributes {
    /// Get effective foreground color (handles inverse)
    pub fn effective_fg(&self) -> TerminalColor {
        if self.inverse {
            self.bg
        } else {
            self.fg
        }
    }

    /// Get effective background color (handles inverse)
    pub fn effective_bg(&self) -> TerminalColor {
        if self.inverse {
            self.fg
        } else {
            self.bg
        }
    }
}

/// Terminal Cell (single character in the virtual screen)
#[derive(Debug, Clone, Default)]
pub struct TerminalCell {
    /// Character (UTF-8)
    pub c: char,
    /// Cell attributes
    pub attrs: CellAttributes,
}

impl TerminalCell {
    /// Create a new terminal cell
    pub fn new(c: char, attrs: CellAttributes) -> Self {
        Self { c, attrs }
    }

    /// Create a blank cell with default attributes
    pub fn blank() -> Self {
        Self {
            c: ' ',
            attrs: CellAttributes::default(),
        }
    }
}

/// Terminal Buffer (virtual screen)
#[derive(Debug)]
pub struct TerminalBuffer {
    /// 2D grid of cells
    cells: Vec<Vec<TerminalCell>>,
    /// Cursor row (0-indexed)
    cursor_row: usize,
    /// Cursor column (0-indexed)
    cursor_col: usize,
    /// Number of rows
    rows: usize,
    /// Number of columns
    cols: usize,
    /// Scrollback buffer (for history)
    scrollback: Vec<Vec<TerminalCell>>,
    /// Maximum scrollback lines
    max_scrollback: usize,
    /// Phase 30.8: View offset (lines scrolled back from bottom)
    view_offset: usize,
}

impl TerminalBuffer {
    /// Create a new terminal buffer with specified dimensions
    pub fn new(rows: usize, cols: usize) -> Self {
        let cells = vec![vec![TerminalCell::blank(); cols]; rows];
        Self {
            cells,
            cursor_row: 0,
            cursor_col: 0,
            rows,
            cols,
            scrollback: Vec::new(),
            max_scrollback: 1000,
            view_offset: 0,
        }
    }

    /// Resize the terminal buffer with text reflow
    pub fn resize(&mut self, new_rows: usize, new_cols: usize) {
        log::info!(
            "📐 Resizing terminal buffer: {}x{} -> {}x{}",
            self.rows,
            self.cols,
            new_rows,
            new_cols
        );

        // Phase 32: Text reflow on resize
        // Extract all logical lines (including scrollback)
        let logical_lines = self.extract_logical_lines();

        // Reflow lines to new width
        let reflowed_lines = self.reflow_lines(&logical_lines, new_cols);

        // Create new buffer
        let mut new_cells = vec![vec![TerminalCell::blank(); new_cols]; new_rows];

        // Copy reflowed lines (preserving as much as possible)
        let copy_count = std::cmp::min(reflowed_lines.len(), new_rows);
        for row in 0..copy_count {
            let line = &reflowed_lines[row];
            let cols_to_copy = std::cmp::min(line.len(), new_cols);
            new_cells[row][..cols_to_copy].clone_from_slice(&line[..cols_to_copy]);
        }

        self.cells = new_cells;

        self.rows = new_rows;
        self.cols = new_cols;
        // Phase 30.8: Reset view offset on resize to prevent out-of-bounds
        self.view_offset = 0;

        // Adjust cursor if needed
        self.cursor_row = std::cmp::min(self.cursor_row, new_rows - 1);
        self.cursor_col = std::cmp::min(self.cursor_col, new_cols - 1);

        log::info!(
            "✅ Terminal resized with text reflow: {} lines reflowed",
            copy_count
        );
    }

    /// Extract all logical lines from buffer (including scrollback)
    fn extract_logical_lines(&self) -> Vec<Vec<TerminalCell>> {
        let mut logical_lines = Vec::new();

        // Extract scrollback lines
        for line in &self.scrollback {
            // Pad or truncate scrollback lines to current width
            let mut padded_line = line.clone();
            if padded_line.len() < self.cols {
                padded_line.extend(vec![TerminalCell::blank(); self.cols - padded_line.len()]);
            } else if padded_line.len() > self.cols {
                padded_line.truncate(self.cols);
            }
            logical_lines.push(padded_line);
        }

        // Extract active buffer lines
        for row in &self.cells {
            logical_lines.push(row.clone());
        }

        logical_lines
    }

    /// Reflow lines to fit new width (with word wrapping)
    fn reflow_lines(
        &self,
        lines: &[Vec<TerminalCell>],
        new_width: usize,
    ) -> Vec<Vec<TerminalCell>> {
        let mut reflowed = Vec::new();

        for line in lines {
            if line.len() <= new_width {
                // Line fits, just copy it
                reflowed.push(line.clone());
            } else {
                // Line is too wide, need to wrap
                let mut current_line = Vec::new();
                let mut word_start = 0;

                for (i, cell) in line.iter().enumerate() {
                    // Check if we've exceeded the width
                    if i >= new_width {
                        // Try to find a good break point
                        let break_point = self.find_break_point(&line[word_start..i]);

                        if break_point > word_start {
                            // Found a good break point
                            current_line.extend_from_slice(&line[word_start..break_point]);
                            reflowed.push(std::mem::take(&mut current_line));
                            word_start = break_point;
                        } else {
                            // No good break point, force break at width
                            current_line.extend_from_slice(&line[word_start..new_width]);
                            reflowed.push(std::mem::take(&mut current_line));
                            word_start = new_width;
                        }
                    }

                    current_line.push(cell.clone());
                }

                // Add remaining cells
                if !current_line.is_empty() {
                    reflowed.push(current_line);
                }
            }
        }

        reflowed
    }

    /// Find a good break point in a line (prefer word boundaries)
    fn find_break_point(&self, cells: &[TerminalCell]) -> usize {
        // Search backwards from the end for a space
        for i in (0..cells.len()).rev() {
            if cells[i].c == ' ' || cells[i].c == '\t' {
                return i + 1; // Break after the space
            }
        }

        // No space found, return the end (force break)
        cells.len()
    }

    /// Write a character at the cursor position
    pub fn write_char(&mut self, c: char, attrs: CellAttributes) {
        if self.cursor_row < self.rows && self.cursor_col < self.cols {
            self.cells[self.cursor_row][self.cursor_col] = TerminalCell::new(c, attrs);
            self.advance_cursor();
            // Phase 30.8: Reset view to bottom on input
            self.view_offset = 0;
        }
    }

    /// Write character with damage tracking (Phase 30.8)
    pub fn write_char_tracked(
        &mut self,
        c: char,
        attrs: CellAttributes,
        tracker: &mut crate::damage_tracker::DamageTracker,
    ) {
        if self.cursor_row < self.rows && self.cursor_col < self.cols {
            self.cells[self.cursor_row][self.cursor_col] = TerminalCell::new(c, attrs);
            tracker.mark_dirty(self.cursor_col as u32, self.cursor_row as u32);
            self.advance_cursor();
            self.view_offset = 0;
        }
    }

    /// Mark entire screen as damaged (for full redraw)
    pub fn mark_full_damage(&self, tracker: &mut crate::damage_tracker::DamageTracker) {
        tracker.mark_rect_dirty(0, 0, self.cols as u32, self.rows as u32);
    }

    /// Advance cursor to next position (handles wrapping and scrolling)
    pub fn advance_cursor(&mut self) {
        self.cursor_col += 1;

        if self.cursor_col >= self.cols {
            self.cursor_col = 0;
            self.cursor_row += 1;

            if self.cursor_row >= self.rows {
                self.scroll_up();
                self.cursor_row = self.rows - 1;
            }
        }
    }

    /// Move cursor to specific position
    pub fn move_cursor(&mut self, row: usize, col: usize) {
        self.cursor_row = std::cmp::min(row, self.rows - 1);
        self.cursor_col = std::cmp::min(col, self.cols - 1);
    }

    /// Move cursor relative to current position
    pub fn move_cursor_relative(&mut self, row_delta: i32, col_delta: i32) {
        let new_row = (self.cursor_row as i32 + row_delta).max(0) as usize;
        let new_col = (self.cursor_col as i32 + col_delta).max(0) as usize;
        self.move_cursor(new_row, new_col);
    }

    /// Scroll up one line (move current line to scrollback)
    pub fn scroll_up(&mut self) {
        // Move first line to scrollback
        if let Some(first_line) = self.cells.first() {
            self.scrollback.push(first_line.clone());

            // Limit scrollback size
            if self.scrollback.len() > self.max_scrollback {
                self.scrollback.remove(0);
            }
        }

        // Shift all lines up
        for row in 0..self.rows - 1 {
            self.cells[row] = self.cells[row + 1].clone();
        }

        // Clear last line
        self.cells[self.rows - 1] = vec![TerminalCell::blank(); self.cols];
    }

    /// Clear line from cursor to end
    pub fn clear_line_to_end(&mut self) {
        if self.cursor_row < self.rows {
            for col in self.cursor_col..self.cols {
                self.cells[self.cursor_row][col] = TerminalCell::blank();
            }
        }
    }

    /// Clear line from start to cursor
    pub fn clear_line_to_start(&mut self) {
        if self.cursor_row < self.rows {
            for col in 0..=self.cursor_col {
                self.cells[self.cursor_row][col] = TerminalCell::blank();
            }
        }
    }

    /// Clear entire line
    pub fn clear_line(&mut self) {
        if self.cursor_row < self.rows {
            self.cells[self.cursor_row] = vec![TerminalCell::blank(); self.cols];
        }
    }

    /// Clear screen from cursor to end
    pub fn clear_screen_to_end(&mut self) {
        // Clear current line from cursor
        self.clear_line_to_end();

        // Clear all lines below
        for row in (self.cursor_row + 1)..self.rows {
            self.cells[row] = vec![TerminalCell::blank(); self.cols];
        }
    }

    /// Clear screen from start to cursor
    pub fn clear_screen_to_start(&mut self) {
        // Clear all lines above
        for row in 0..self.cursor_row {
            self.cells[row] = vec![TerminalCell::blank(); self.cols];
        }

        // Clear current line to cursor
        self.clear_line_to_start();
    }

    /// Clear entire screen
    pub fn clear_screen(&mut self) {
        for row in 0..self.rows {
            self.cells[row] = vec![TerminalCell::blank(); self.cols];
        }
        self.move_cursor(0, 0);
    }

    /// Get cell at position
    pub fn get_cell(&self, row: usize, col: usize) -> Option<&TerminalCell> {
        if row < self.rows && col < self.cols {
            Some(&self.cells[row][col])
        } else {
            None
        }
    }

    /// Get mutable cell at position
    pub fn get_cell_mut(&mut self, row: usize, col: usize) -> Option<&mut TerminalCell> {
        if row < self.rows && col < self.cols {
            Some(&mut self.cells[row][col])
        } else {
            None
        }
    }

    /// Get cursor position
    pub fn get_cursor(&self) -> (usize, usize) {
        (self.cursor_row, self.cursor_col)
    }

    /// Get buffer dimensions
    pub fn get_size(&self) -> (usize, usize) {
        (self.rows, self.cols)
    }

    /// Get scrollback buffer
    pub fn get_scrollback(&self) -> &[Vec<TerminalCell>] {
        &self.scrollback
    }

    // Phase 30.8: Scrollback Support methods

    /// Get cell for rendering (accounts for view offset)
    pub fn get_render_cell(&self, row: usize, col: usize) -> Option<&TerminalCell> {
        let total_history = self.scrollback.len();

        // If no scrollback, just return normal cell
        if self.view_offset == 0 {
            return self.get_cell(row, col);
        }

        // Calculate logical line index
        // The view shows 'rows' lines ending at (total_history + rows - view_offset)
        // logic:
        // visible_bottom_index = total_history + self.rows (theoretical index if all concatenated)
        // we want to see lines: [visible_bottom_index - rows - view_offset ... visible_bottom_index - view_offset]

        // Simpler logic:
        // We are looking 'view_offset' lines into the past.
        // effective_row = (current absolute row defined as scrollback + active) - view_offset

        // Let's define absolute row 0 as start of scrollback.
        // Last line of scrollback is index 'total_history - 1'
        // Row 0 of cells is index 'total_history'

        // The line we want to render at screen 'row' is:
        // absolute_index = total_history + row - view_offset

        // Handle underflow (scrolled past top of history)
        if (total_history + row) < self.view_offset {
            // Use blank cell for out of bounds at top
            return None;
        }

        let absolute_index = (total_history + row) - self.view_offset;

        if absolute_index < total_history {
            // It's in history
            if col < self.cols {
                // Assuming history lines are same width?
                // Note: scrollback lines might have different width if resized.
                // We should handle that safely.
                let line = &self.scrollback[absolute_index];
                if col < line.len() {
                    Some(&line[col])
                } else {
                    None // treat as blank
                }
            } else {
                None
            }
        } else {
            // It's in active buffer
            let active_row = absolute_index - total_history;
            self.get_cell(active_row, col)
        }
    }

    /// Scroll view up (back in time)
    pub fn scroll_view_up(&mut self, lines: usize) {
        let total_history = self.scrollback.len();
        if total_history == 0 {
            return;
        }

        self.view_offset = std::cmp::min(self.view_offset + lines, total_history);
    }

    /// Scroll view down (forward in time)
    pub fn scroll_view_down(&mut self, lines: usize) {
        if self.view_offset > lines {
            self.view_offset -= lines;
        } else {
            self.view_offset = 0;
        }
    }

    /// Scroll to top of history
    pub fn scroll_view_to_top(&mut self) {
        self.view_offset = self.scrollback.len();
    }

    /// Scroll to bottom (reset view)
    pub fn scroll_view_to_bottom(&mut self) {
        self.view_offset = 0;
    }

    /// Get current view offset
    pub fn get_view_offset(&self) -> usize {
        self.view_offset
    }
}

/// Terminal Emulator (VTE parser wrapper)
#[cfg(feature = "hypervisor")]
pub struct TerminalEmulator {
    /// Virtual screen buffer
    buffer: TerminalBuffer,
    /// Current attributes
    current_attrs: CellAttributes,
    /// VTE parser
    parser: Option<Parser>,
    /// Saved cursor position (for ANSI save/restore)
    saved_cursor: Option<(usize, usize)>,
    /// Saved attributes (for ANSI save/restore)
    saved_attrs: Option<CellAttributes>,
    /// Alternate screen buffer (for applications like vim/htop)
    alt_buffer: Option<TerminalBuffer>,
    /// Using alternate screen buffer
    using_alt_buffer: bool,
    /// Phase 30.8: Cursor visibility
    cursor_visible: bool,
    /// Phase 30.8: Cursor blink state (0.0 = hidden, 1.0 = visible)
    cursor_blink_state: f32,
    /// Phase 30.8: Cursor blink timer (accumulated time)
    cursor_blink_timer: f32,
}

#[cfg(feature = "hypervisor")]
impl TerminalEmulator {
    /// Create a new terminal emulator with specified dimensions
    pub fn new(rows: usize, cols: usize) -> Self {
        Self {
            buffer: TerminalBuffer::new(rows, cols),
            current_attrs: CellAttributes::default(),
            parser: Some(Parser::new()),
            saved_cursor: None,
            saved_attrs: None,
            alt_buffer: None,
            using_alt_buffer: false,
            cursor_visible: true,
            cursor_blink_state: 1.0,
            cursor_blink_timer: 0.0,
        }
    }

    /// Feed bytes to the terminal emulator (processes ANSI escape sequences)
    pub fn feed(&mut self, bytes: &[u8]) {
        if let Some(mut parser) = self.parser.take() {
            for byte in bytes {
                parser.advance(self, *byte);
            }
            self.parser = Some(parser);
        }
    }

    /// Get the current buffer (main or alternate)
    fn get_current_buffer(&mut self) -> &mut TerminalBuffer {
        if self.using_alt_buffer {
            self.alt_buffer.as_mut().unwrap()
        } else {
            &mut self.buffer
        }
    }

    /// Resize the terminal
    pub fn resize(&mut self, new_rows: usize, new_cols: usize) {
        self.buffer.resize(new_rows, new_cols);
        if let Some(ref mut alt) = self.alt_buffer {
            alt.resize(new_rows, new_cols);
        }
    }

    /// Get the current buffer for rendering
    pub fn get_buffer(&self) -> &TerminalBuffer {
        if self.using_alt_buffer {
            self.alt_buffer.as_ref().unwrap()
        } else {
            &self.buffer
        }
    }

    /// Get the main buffer
    pub fn get_main_buffer(&self) -> &TerminalBuffer {
        &self.buffer
    }

    /// Convert key input to ANSI escape sequence
    pub fn key_to_ansi(&self, key: &str) -> Vec<u8> {
        match key {
            "Up" => b"\x1b[A".to_vec(),
            "Down" => b"\x1b[B".to_vec(),
            "Right" => b"\x1b[C".to_vec(),
            "Left" => b"\x1b[D".to_vec(),
            "Home" => b"\x1b[H".to_vec(),
            "End" => b"\x1b[F".to_vec(),
            "F1" => b"\x1bOP".to_vec(),
            "F2" => b"\x1bOQ".to_vec(),
            "F3" => b"\x1bOR".to_vec(),
            "F4" => b"\x1bOS".to_vec(),
            "F5" => b"\x1b[15~".to_vec(),
            "F6" => b"\x1b[17~".to_vec(),
            "F7" => b"\x1b[18~".to_vec(),
            "F8" => b"\x1b[19~".to_vec(),
            "F9" => b"\x1b[20~".to_vec(),
            "F10" => b"\x1b[21~".to_vec(),
            "F11" => b"\x1b[23~".to_vec(),
            "F12" => b"\x1b[24~".to_vec(),
            "PageUp" => b"\x1b[5~".to_vec(),
            "PageDown" => b"\x1b[6~".to_vec(),
            "Insert" => b"\x1b[2~".to_vec(),
            "Delete" => b"\x1b[3~".to_vec(),
            "Tab" => b"\t".to_vec(),
            "Enter" => b"\n".to_vec(),
            "Backspace" => b"\x7f".to_vec(),
            "Escape" => b"\x1b".to_vec(),
            _ => {
                // Regular character
                key.as_bytes().to_vec()
            }
        }
    }

    /// Get terminal dimensions
    pub fn get_size(&self) -> (usize, usize) {
        self.buffer.get_size()
    }

    // Phase 30.8: Cursor Control Methods

    /// Set cursor visibility
    pub fn set_cursor_visible(&mut self, visible: bool) {
        self.cursor_visible = visible;
    }

    /// Get cursor visibility
    pub fn is_cursor_visible(&self) -> bool {
        self.cursor_visible
    }

    /// Update cursor blink state (call this each frame)
    pub fn update_cursor_blink(&mut self, delta_time: f32) {
        if !self.cursor_visible {
            return;
        }

        // Accumulate time
        self.cursor_blink_timer += delta_time;

        // Blink every 500ms (0.5 seconds)
        if self.cursor_blink_timer >= 0.5 {
            self.cursor_blink_timer = 0.0;
            // Toggle blink state
            self.cursor_blink_state = if self.cursor_blink_state > 0.5 {
                0.0
            } else {
                1.0
            };
        }
    }

    /// Get cursor blink state (0.0 = hidden, 1.0 = visible)
    pub fn get_cursor_blink_state(&self) -> f32 {
        self.cursor_blink_state
    }

    /// Get cursor position
    pub fn get_cursor_position(&self) -> (usize, usize) {
        self.buffer.get_cursor()
    }

    // Phase 30.8: Scrollback Control

    pub fn scroll_up(&mut self, lines: usize) {
        self.buffer.scroll_view_up(lines);
    }

    pub fn scroll_down(&mut self, lines: usize) {
        self.buffer.scroll_view_down(lines);
    }

    pub fn get_view_offset(&self) -> usize {
        self.buffer.get_view_offset()
    }
}

#[cfg(feature = "hypervisor")]
impl Perform for TerminalEmulator {
    /// Print a character
    fn print(&mut self, c: char) {
        let attrs = self.current_attrs;
        let buffer = self.get_current_buffer();
        buffer.write_char(c, attrs);
    }

    /// Execute a C0 or C1 control function
    fn execute(&mut self, byte: u8) {
        let buffer = self.get_current_buffer();

        match byte {
            0x08 => {
                // Backspace (move cursor back)
                buffer.move_cursor_relative(0, -1);
            }
            0x09 => {
                // Tab (move cursor to next tab stop, simplified to 8 spaces)
                let (row, col) = buffer.get_cursor();
                let next_tab = ((col / 8) + 1) * 8;
                buffer.move_cursor(row, next_tab);
            }
            0x0A => {
                // Line feed (move cursor down, possibly scroll)
                let (row, col) = buffer.get_cursor();
                if row + 1 >= buffer.get_size().0 {
                    buffer.scroll_up();
                    buffer.move_cursor(buffer.get_size().0 - 1, col);
                } else {
                    buffer.move_cursor(row + 1, col);
                }
            }
            0x0D => {
                // Carriage return (move cursor to start of line)
                let (row, _) = buffer.get_cursor();
                buffer.move_cursor(row, 0);
            }
            _ => {
                // Other control characters
                log::debug!("⚠️  Unhandled control byte: 0x{:02x}", byte);
            }
        }
    }

    /// Hook received
    fn hook(&mut self, params: &Params, intermediates: &[u8], ignore: bool, c: char) {
        let params: Vec<i64> = params
            .into_iter()
            .map(|p| p.first().copied().unwrap_or(0) as i64)
            .collect();
        log::debug!(
            "⚠️  Unhandled hook: params={:?}, intermediates={:?}, ignore={}, c={}",
            params,
            intermediates,
            ignore,
            c
        );
    }

    /// Put received
    fn put(&mut self, byte: u8) {
        log::debug!("⚠️  Unhandled put: 0x{:02x}", byte);
    }

    /// Unhook received
    fn unhook(&mut self) {
        log::debug!("⚠️  Unhandled unhook");
    }

    /// OSC dispatch received
    fn osc_dispatch(&mut self, params: &[&[u8]], bell_terminated: bool) {
        log::debug!(
            "⚠️  Unhandled OSC dispatch: params={:?}, bell_terminated={}",
            params,
            bell_terminated
        );
    }

    /// CSI dispatch received
    fn csi_dispatch(&mut self, params: &Params, _intermediates: &[u8], _ignore: bool, c: char) {
        // Collect params to Vec<i64> for backward compatibility and ownership
        let params: Vec<i64> = params
            .into_iter()
            .map(|p| p.first().copied().unwrap_or(0) as i64)
            .collect();

        let buffer = if self.using_alt_buffer {
            self.alt_buffer.as_mut().unwrap()
        } else {
            &mut self.buffer
        };

        match c {
            // Cursor Position
            'H' | 'f' => {
                // CSI <row>;<col> H
                let row = params.first().copied().unwrap_or(1).max(1) as usize - 1;
                let col = params.get(1).copied().unwrap_or(1).max(1) as usize - 1;
                buffer.move_cursor(row, col);
            }

            // Cursor Up
            'A' => {
                let count = params.first().copied().unwrap_or(1).max(1) as i32;
                buffer.move_cursor_relative(-count, 0);
            }

            // Cursor Down
            'B' => {
                let count = params.first().copied().unwrap_or(1).max(1) as i32;
                buffer.move_cursor_relative(count, 0);
            }

            // Cursor Forward
            'C' => {
                let count = params.first().copied().unwrap_or(1).max(1) as i32;
                buffer.move_cursor_relative(0, count);
            }

            // Cursor Back
            'D' => {
                let count = params.first().copied().unwrap_or(1).max(1) as i32;
                buffer.move_cursor_relative(0, -count);
            }

            // Cursor Next Line
            'E' => {
                let count = params.first().copied().unwrap_or(1).max(1) as i32;
                let (_, _col) = buffer.get_cursor();
                buffer.move_cursor_relative(count, 0);
                buffer.move_cursor(buffer.get_cursor().0, 0);
            }

            // Cursor Previous Line
            'F' => {
                let count = params.first().copied().unwrap_or(1).max(1) as i32;
                let (_, _col) = buffer.get_cursor();
                buffer.move_cursor_relative(-count, 0);
                buffer.move_cursor(buffer.get_cursor().0, 0);
            }

            // Cursor Horizontal Absolute
            'G' => {
                let col = params.first().copied().unwrap_or(1).max(1) as usize - 1;
                let (row, _) = buffer.get_cursor();
                buffer.move_cursor(row, col);
            }

            // Erase Display
            'J' => {
                let mode = params.first().copied().unwrap_or(0);
                match mode {
                    0 => buffer.clear_screen_to_end(),
                    1 => buffer.clear_screen_to_start(),
                    2 => buffer.clear_screen(),
                    3 => {
                        // Clear entire display and scrollback (not implemented)
                        buffer.clear_screen();
                    }
                    _ => log::warn!("⚠️  Unknown erase display mode: {}", mode),
                }
            }

            // Erase in Line
            'K' => {
                let mode = params.first().copied().unwrap_or(0);
                match mode {
                    0 => buffer.clear_line_to_end(),
                    1 => buffer.clear_line_to_start(),
                    2 => buffer.clear_line(),
                    _ => log::warn!("⚠️  Unknown erase line mode: {}", mode),
                }
            }

            // Select Graphic Rendition
            'm' => {
                if params.is_empty() {
                    // Reset all attributes
                    self.current_attrs = CellAttributes::default();
                } else {
                    for param in &params {
                        match *param {
                            0 => self.current_attrs = CellAttributes::default(),
                            1 => self.current_attrs.bold = true,
                            2 => self.current_attrs.dim = true,
                            3 => self.current_attrs.italic = true,
                            4 => self.current_attrs.underline = true,
                            5 | 6 => self.current_attrs.blink = true,
                            7 => self.current_attrs.inverse = true,
                            8 => self.current_attrs.hidden = true,
                            9 => self.current_attrs.strikethrough = true,
                            21 => self.current_attrs.bold = false,
                            22 => {
                                self.current_attrs.bold = false;
                                self.current_attrs.dim = false;
                            }
                            23 => self.current_attrs.italic = false,
                            24 => self.current_attrs.underline = false,
                            25 => self.current_attrs.blink = false,
                            27 => self.current_attrs.inverse = false,
                            28 => self.current_attrs.hidden = false,
                            29 => self.current_attrs.strikethrough = false,
                            30..=37 => {
                                self.current_attrs.fg = match param {
                                    30 => TerminalColor::Black,
                                    31 => TerminalColor::Red,
                                    32 => TerminalColor::Green,
                                    33 => TerminalColor::Yellow,
                                    34 => TerminalColor::Blue,
                                    35 => TerminalColor::Magenta,
                                    36 => TerminalColor::Cyan,
                                    37 => TerminalColor::White,
                                    _ => TerminalColor::White,
                                };
                            }
                            38 => {
                                // Extended foreground color
                                if let Some(&mode) = params.get(1) {
                                    if mode == 5 {
                                        // 256-color mode
                                        if let Some(&idx) = params.get(2) {
                                            self.current_attrs.fg =
                                                TerminalColor::Indexed(idx as u8);
                                        }
                                    } else if mode == 2 {
                                        // 24-bit RGB mode
                                        if let (Some(&r), Some(&g), Some(&b)) =
                                            (params.get(2), params.get(3), params.get(4))
                                        {
                                            self.current_attrs.fg =
                                                TerminalColor::Rgb(r as u8, g as u8, b as u8);
                                        }
                                    }
                                }
                            }
                            39 => self.current_attrs.fg = TerminalColor::White,
                            40..=47 => {
                                self.current_attrs.bg = match param {
                                    40 => TerminalColor::Black,
                                    41 => TerminalColor::Red,
                                    42 => TerminalColor::Green,
                                    43 => TerminalColor::Yellow,
                                    44 => TerminalColor::Blue,
                                    45 => TerminalColor::Magenta,
                                    46 => TerminalColor::Cyan,
                                    47 => TerminalColor::White,
                                    _ => TerminalColor::Black,
                                };
                            }
                            48 => {
                                // Extended background color
                                if let Some(&mode) = params.get(1) {
                                    if mode == 5 {
                                        // 256-color mode
                                        if let Some(&idx) = params.get(2) {
                                            self.current_attrs.bg =
                                                TerminalColor::Indexed(idx as u8);
                                        }
                                    } else if mode == 2 {
                                        // 24-bit RGB mode
                                        if let (Some(&r), Some(&g), Some(&b)) =
                                            (params.get(2), params.get(3), params.get(4))
                                        {
                                            self.current_attrs.bg =
                                                TerminalColor::Rgb(r as u8, g as u8, b as u8);
                                        }
                                    }
                                }
                            }
                            49 => self.current_attrs.bg = TerminalColor::Black,
                            90..=97 => {
                                self.current_attrs.fg = match param {
                                    90 => TerminalColor::BrightBlack,
                                    91 => TerminalColor::BrightRed,
                                    92 => TerminalColor::BrightGreen,
                                    93 => TerminalColor::BrightYellow,
                                    94 => TerminalColor::BrightBlue,
                                    95 => TerminalColor::BrightMagenta,
                                    96 => TerminalColor::BrightCyan,
                                    97 => TerminalColor::BrightWhite,
                                    _ => TerminalColor::White,
                                };
                            }
                            100..=107 => {
                                self.current_attrs.bg = match param {
                                    100 => TerminalColor::BrightBlack,
                                    101 => TerminalColor::BrightRed,
                                    102 => TerminalColor::BrightGreen,
                                    103 => TerminalColor::BrightYellow,
                                    104 => TerminalColor::BrightBlue,
                                    105 => TerminalColor::BrightMagenta,
                                    106 => TerminalColor::BrightCyan,
                                    107 => TerminalColor::BrightWhite,
                                    _ => TerminalColor::Black,
                                };
                            }
                            _ => log::debug!("⚠️  Unknown SGR parameter: {}", param),
                        }
                    }
                }
            }

            // Device Status Report
            'n' => {
                let mode = params.first().copied().unwrap_or(0);
                if mode == 6 {
                    // Report cursor position (not implemented - would need to send response back to guest)
                    log::debug!("📍 Cursor position report requested");
                }
            }

            // Save Cursor
            's' => {
                self.saved_cursor = Some(buffer.get_cursor());
                self.saved_attrs = Some(self.current_attrs);
            }

            // Restore Cursor
            'u' => {
                let saved_cursor = self.saved_cursor;
                if let Some((row, col)) = saved_cursor {
                    buffer.move_cursor(row, col);
                }
                if let Some(attrs) = self.saved_attrs {
                    self.current_attrs = attrs;
                }
            }

            _ => {
                log::debug!("⚠️  Unhandled CSI sequence: params={:?}, c={}", params, c);
            }
        }
    }

    /// ESC dispatch received
    fn esc_dispatch(&mut self, intermediates: &[u8], ignore: bool, byte: u8) {
        let buffer = if self.using_alt_buffer {
            self.alt_buffer.as_mut().unwrap()
        } else {
            &mut self.buffer
        };

        match byte {
            // Save cursor (alternative to CSI s)
            b'7' => {
                self.saved_cursor = Some(buffer.get_cursor());
                self.saved_attrs = Some(self.current_attrs);
            }

            // Restore cursor (alternative to CSI u)
            b'8' => {
                let saved_cursor = self.saved_cursor;
                if let Some((row, col)) = saved_cursor {
                    buffer.move_cursor(row, col);
                }
                if let Some(attrs) = self.saved_attrs {
                    self.current_attrs = attrs;
                }
            }

            // Next line
            b'D' => {
                let (row, _) = buffer.get_cursor();
                if row + 1 >= buffer.get_size().0 {
                    buffer.scroll_up();
                    buffer.move_cursor(buffer.get_size().0 - 1, 0);
                } else {
                    buffer.move_cursor(row + 1, 0);
                }
            }

            // Index
            b'E' => {
                let (row, _) = buffer.get_cursor();
                if row + 1 >= buffer.get_size().0 {
                    buffer.scroll_up();
                    buffer.move_cursor(buffer.get_size().0 - 1, 0);
                } else {
                    buffer.move_cursor(row + 1, 0);
                }
            }

            // Reverse Index
            b'M' => {
                let (row, col) = buffer.get_cursor();
                if row == 0 {
                    // Scroll down (not implemented - would need to insert blank line at top)
                    buffer.move_cursor(0, col);
                } else {
                    buffer.move_cursor(row - 1, col);
                }
            }

            // Reset terminal
            b'c' => {
                buffer.clear_screen();
                self.current_attrs = CellAttributes::default();
            }

            _ => {
                log::debug!(
                    "⚠️  Unhandled ESC sequence: intermediates={:?}, ignore={}, byte=0x{:02x}",
                    intermediates,
                    ignore,
                    byte
                );
            }
        }
    }
}

/// Stub implementation for non-hypervisor builds
#[cfg(not(feature = "hypervisor"))]
pub struct TerminalEmulator {
    _private: (),
}

#[cfg(not(feature = "hypervisor"))]
impl TerminalEmulator {
    pub fn new(_rows: usize, _cols: usize) -> Self {
        log::warn!("⚠️  Hypervisor feature not enabled. TerminalEmulator is a stub.");
        Self { _private: () }
    }

    pub fn feed(&mut self, _bytes: &[u8]) {
        log::warn!("⚠️  Hypervisor feature not enabled. feed() ignored.");
    }

    pub fn resize(&mut self, _new_rows: usize, _new_cols: usize) {
        log::warn!("⚠️  Hypervisor feature not enabled. resize() ignored.");
    }

    pub fn get_buffer(&self) -> &TerminalBuffer {
        static EMPTY_BUFFER: TerminalBuffer = TerminalBuffer {
            cells: Vec::new(),
            cursor_row: 0,
            cursor_col: 0,
            rows: 0,
            cols: 0,
            scrollback: Vec::new(),
            max_scrollback: 0,
            view_offset: 0,
        };
        &EMPTY_BUFFER
    }

    pub fn get_main_buffer(&self) -> &TerminalBuffer {
        self.get_buffer()
    }

    pub fn key_to_ansi(&self, _key: &str) -> Vec<u8> {
        Vec::new()
    }

    pub fn get_size(&self) -> (usize, usize) {
        (0, 0)
    }

    // Phase 30.8: Cursor Control Methods (stubs)
    pub fn set_cursor_visible(&mut self, _visible: bool) {
        log::warn!("⚠️  Hypervisor feature not enabled. set_cursor_visible() ignored.");
    }

    pub fn is_cursor_visible(&self) -> bool {
        false
    }

    pub fn update_cursor_blink(&mut self, _delta_time: f32) {
        log::warn!("⚠️  Hypervisor feature not enabled. update_cursor_blink() ignored.");
    }

    pub fn get_cursor_blink_state(&self) -> f32 {
        0.0
    }

    pub fn get_cursor_position(&self) -> (usize, usize) {
        (0, 0)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_terminal_cell_creation() {
        let cell = TerminalCell::new('A', CellAttributes::default());
        assert_eq!(cell.c, 'A');
    }

    #[test]
    fn test_terminal_buffer_creation() {
        let buffer = TerminalBuffer::new(24, 80);
        assert_eq!(buffer.get_size(), (24, 80));
        assert_eq!(buffer.get_cursor(), (0, 0));
    }

    #[test]
    fn test_terminal_buffer_write_char() {
        let mut buffer = TerminalBuffer::new(24, 80);
        buffer.write_char('A', CellAttributes::default());
        assert_eq!(buffer.get_cursor(), (0, 1));
        assert_eq!(buffer.get_cell(0, 0).unwrap().c, 'A');
    }

    #[test]
    fn test_terminal_buffer_clear_screen() {
        let mut buffer = TerminalBuffer::new(24, 80);
        buffer.write_char('A', CellAttributes::default());
        buffer.clear_screen();
        assert_eq!(buffer.get_cursor(), (0, 0));
        assert_eq!(buffer.get_cell(0, 0).unwrap().c, ' ');
    }

    #[test]
    fn test_terminal_color_to_rgba() {
        let color = TerminalColor::Red;
        let rgba = color.to_rgba();
        assert_eq!(rgba[0], 194); // R
        assert_eq!(rgba[1], 54); // G
        assert_eq!(rgba[2], 33); // B
        assert_eq!(rgba[3], 255); // A
    }

    #[test]
    fn test_terminal_color_to_neon() {
        let red = TerminalColor::Red;
        assert_eq!(red.to_neon(), 0.95); // High entropy

        let green = TerminalColor::Green;
        assert_eq!(green.to_neon(), 0.15); // Low entropy

        let blue = TerminalColor::Blue;
        assert_eq!(blue.to_neon(), 0.50); // Mid entropy
    }

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_terminal_emulator_creation() {
        let emulator = TerminalEmulator::new(24, 80);
        assert_eq!(emulator.get_size(), (24, 80));
    }

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_terminal_emulator_feed() {
        let mut emulator = TerminalEmulator::new(24, 80);
        emulator.feed(b"Hello");
        let buffer = emulator.get_buffer();
        assert_eq!(buffer.get_cell(0, 0).unwrap().c, 'H');
        assert_eq!(buffer.get_cell(0, 1).unwrap().c, 'e');
        assert_eq!(buffer.get_cell(0, 2).unwrap().c, 'l');
        assert_eq!(buffer.get_cell(0, 3).unwrap().c, 'l');
        assert_eq!(buffer.get_cell(0, 4).unwrap().c, 'o');
    }

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_terminal_emulator_ansi_color() {
        let mut emulator = TerminalEmulator::new(24, 80);
        emulator.feed(b"\x1b[31mRed Text\x1b[0m");
        let buffer = emulator.get_buffer();
        assert_eq!(buffer.get_cell(0, 0).unwrap().c, 'R');
        assert_eq!(buffer.get_cell(0, 0).unwrap().attrs.fg, TerminalColor::Red);
    }

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_terminal_emulator_cursor_movement() {
        let mut emulator = TerminalEmulator::new(24, 80);
        emulator.feed(b"AB\x1b[2DC");
        let buffer = emulator.get_buffer();
        // Cursor starts at 0. Write A (pos 1), B (pos 2).
        // Move back 2 (pos 0). Write C. Result: C at 0, B at 1.
        assert_eq!(buffer.get_cell(0, 0).unwrap().c, 'C');
        assert_eq!(buffer.get_cell(0, 1).unwrap().c, 'B');
    }

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_terminal_emulator_clear_screen() {
        let mut emulator = TerminalEmulator::new(24, 80);
        emulator.feed(b"Hello\x1b[2J");
        let buffer = emulator.get_buffer();
        assert_eq!(buffer.get_cell(0, 0).unwrap().c, ' ');
        assert_eq!(buffer.get_cursor(), (0, 0));
    }

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_key_to_ansi() {
        let emulator = TerminalEmulator::new(24, 80);
        assert_eq!(emulator.key_to_ansi("Up"), b"\x1b[A".to_vec());
        assert_eq!(emulator.key_to_ansi("Down"), b"\x1b[B".to_vec());
        assert_eq!(emulator.key_to_ansi("Right"), b"\x1b[C".to_vec());
        assert_eq!(emulator.key_to_ansi("Left"), b"\x1b[D".to_vec());
        assert_eq!(emulator.key_to_ansi("Enter"), b"\n".to_vec());
        assert_eq!(emulator.key_to_ansi("A"), b"A".to_vec());
    }
}
