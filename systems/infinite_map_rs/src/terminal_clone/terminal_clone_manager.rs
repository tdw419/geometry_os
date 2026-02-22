use crate::terminal_clone::pty_engine::PtyEngine;
use crate::terminal_emulator::TerminalEmulator;
use log::{error, info};
use std::collections::HashMap;
use std::io;

/// Terminal Clone: Manages multiple terminal instances with PTY and Emulation
#[cfg(feature = "hypervisor")]
pub struct TerminalClone {
    pub id: usize,
    pub pty: PtyEngine,
    pub emulator: TerminalEmulator,
    pub title: String,
}

#[cfg(feature = "hypervisor")]
pub struct TerminalCloneManager {
    terminals: HashMap<usize, TerminalClone>,
    next_id: usize,
}

#[cfg(feature = "hypervisor")]
impl TerminalCloneManager {
    /// Create a new TerminalCloneManager
    pub fn new() -> Self {
        Self {
            terminals: HashMap::new(),
            next_id: 1,
        }
    }

    /// Create a new terminal clone instance
    pub fn create_terminal(&mut self, rows: u16, cols: u16, shell: &str) -> io::Result<usize> {
        let id = self.next_id;
        self.next_id += 1;

        info!(
            "🚀 Creating terminal clone {} ({}x{}) with shell: {}",
            id, rows, cols, shell
        );

        let pty = PtyEngine::new(rows, cols, shell)?;
        let emulator = TerminalEmulator::new(rows as usize, cols as usize);

        let clone = TerminalClone {
            id,
            pty,
            emulator,
            title: format!("Terminal {}", id),
        };

        self.terminals.insert(id, clone);
        Ok(id)
    }

    /// Update all terminal clones (read from PTY, feed to emulator)
    pub fn update(&mut self) {
        let mut buffer = [0u8; 4096];

        for clone in self.terminals.values_mut() {
            loop {
                match clone.pty.read(&mut buffer) {
                    Ok(n) if n > 0 => {
                        clone.emulator.feed(&buffer[..n]);
                    }
                    Ok(_) => break, // EOF or no data
                    Err(e) if e.kind() == io::ErrorKind::WouldBlock => break,
                    Err(e) => {
                        error!("❌ Error reading from PTY {}: {}", clone.id, e);
                        break;
                    }
                }
            }
        }
    }

    /// Write data to a terminal clone's PTY
    pub fn write_to_terminal(&mut self, id: usize, data: &[u8]) -> io::Result<()> {
        if let Some(clone) = self.terminals.get_mut(&id) {
            clone.pty.write(data)?;
            Ok(())
        } else {
            Err(io::Error::new(
                io::ErrorKind::NotFound,
                "Terminal not found",
            ))
        }
    }

    /// Resize a terminal clone
    pub fn resize_terminal(&mut self, id: usize, rows: u16, cols: u16) -> io::Result<()> {
        if let Some(clone) = self.terminals.get_mut(&id) {
            clone.pty.resize(rows, cols)?;
            clone.emulator.resize(rows as usize, cols as usize);
            Ok(())
        } else {
            Err(io::Error::new(
                io::ErrorKind::NotFound,
                "Terminal not found",
            ))
        }
    }

    /// Get a reference to a terminal's emulator
    pub fn get_emulator(&self, id: usize) -> Option<&TerminalEmulator> {
        self.terminals.get(&id).map(|t| &t.emulator)
    }

    /// List all terminal IDs
    pub fn list_terminals(&self) -> Vec<usize> {
        self.terminals.keys().cloned().collect()
    }

    /// Remove a terminal clone
    pub fn remove_terminal(&mut self, id: usize) {
        self.terminals.remove(&id);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::thread;
    use std::time::{Duration, Instant};

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_terminal_clone_creation_and_update() {
        let mut manager = TerminalCloneManager::new();
        let id = manager
            .create_terminal(24, 80, "/bin/sh")
            .expect("Failed to create terminal");

        // Write to terminal
        manager
            .write_to_terminal(id, b"echo hello_clone\n")
            .expect("Failed to write");

        // Update manager to read from PTY into emulator
        let start = Instant::now();
        while start.elapsed() < Duration::from_secs(2) {
            manager.update();

            if let Some(emulator) = manager.get_emulator(id) {
                let buffer = emulator.get_buffer();
                // Check if buffer contains our string
                let mut found = false;
                for row in 0..24 {
                    let mut line = String::new();
                    for col in 0..80 {
                        if let Some(cell) = buffer.get_cell(row, col) {
                            line.push(cell.c);
                        }
                    }
                    if line.contains("hello_clone") {
                        found = true;
                        break;
                    }
                }
                if found {
                    return;
                }
            }
            thread::sleep(Duration::from_millis(10));
        }

        panic!("Failed to see expected output in emulator buffer");
    }
}
