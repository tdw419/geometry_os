use crate::terminal_emulator::{TerminalEmulator, CellAttributes, TerminalColor};

#[derive(Debug, Clone, PartialEq)]
pub enum ConsoleAction {
    Status,
    Scan,
    Morph,
    Quit,
}

pub struct NeuralConsole {
    emulator: TerminalEmulator,
    input_buffer: String,
    prompt: String,
}

impl NeuralConsole {
    pub fn new() -> Self {
        let mut console = Self {
            emulator: TerminalEmulator::new(30, 80), // Standard size
            input_buffer: String::new(),
            prompt: "GOS> ".to_string(),
        };

        // Print welcome message
        // Print welcome message with Neon Aesthetics
        console.writeln("\x1b[1;92mGeometry OS\x1b[0m \x1b[90m//\x1b[0m \x1b[1;37mNeural Console v1.0\x1b[0m");
        console.writeln("\x1b[90m----------------------------------------\x1b[0m");
        console.writeln("Type '\x1b[1;33mhelp\x1b[0m' for command list.");
        console.write_prompt();

        console
    }

    pub fn write(&mut self, text: &str) {

        for c in text.chars() {
            if c == '\n' {
                 // handle via emulator? Emulator handles \n usually as scrolling
                 // But we need to feed it via `print` inside emulator or feed bytes
                 // TerminalEmulator::feed accepts bytes.
            }
             // For direct writing, let's helper on emulator?
             // terminal_emulator doesn't expose `write_string` easily but `feed` works.
        }
        
        self.emulator.feed(text.as_bytes());
    }

    pub fn writeln(&mut self, text: &str) {
        self.write(text);
        self.write("\n"); // VTE handles \r\n
        self.emulator.feed(b"\r"); // Ensure carriage return
    }



    pub fn write_prompt(&mut self) {
        // Geometry OS Neon Cyan Prompt
        // \x1b[1;96m = Bold Bright Cyan
        self.write("\x1b[1;96m"); 
        let prompt = self.prompt.clone();
        self.write(&prompt);
        self.write("\x1b[0m"); // Reset
    }

    pub fn process_input(&mut self, input: &[u8]) -> Vec<ConsoleAction> {
        let mut actions = Vec::new();
        
        for &byte in input {
            match byte {
                b'\r' | b'\n' => {
                    self.writeln(""); // visual newline
                    let cmd = self.input_buffer.clone();
                    self.input_buffer.clear();
                    
                    if let Some(action) = self.execute_command(&cmd) {
                        actions.push(action);
                        // For external actions, we DON'T print prompt yet
                        // The App is responsible for printing output then prompt
                    } else {
                        // Internal command handled, print prompt
                        self.write_prompt();
                    }
                }
                0x7F | 0x08 => { // Backspace
                     if !self.input_buffer.is_empty() {
                         self.input_buffer.pop();
                         self.write("\x08 \x08"); // destructive backspace
                     }
                }
                _ => {
                    if let Some(c) = char::from_u32(byte as u32) {
                         if !c.is_control() {
                             self.input_buffer.push(c);
                             self.emulator.feed(&[byte]);
                         }
                    }
                }
            }
        }
        
        actions
    }

    fn execute_command(&mut self, cmd: &str) -> Option<ConsoleAction> {
        let parts: Vec<&str> = cmd.trim().split_whitespace().collect();
        if parts.is_empty() {
            return None;
        }

        match parts[0] {
            "help" => {
                self.writeln("Available commands:");
                self.writeln("  help    - Show this message");
                self.writeln("  scan    - Perform neural memory scan");
                self.writeln("  status  - Show system status");
                self.writeln("  morph   - Initiate morphological shift");
                self.writeln("  clear   - Clear screen");
                None
            }
            "clear" => {
                self.emulator.feed(b"\x1b[2J\x1b[H"); // ANSI clear screen
                None
            }
            "status" => {
                Some(ConsoleAction::Status)
            }
            "scan" => {
                Some(ConsoleAction::Scan)
            }
            "morph" => {
                Some(ConsoleAction::Morph)
            }
            "exit" | "quit" => {
                Some(ConsoleAction::Quit)
            }
            _ => {
                self.writeln(&format!("Unknown command: '{}'", parts[0]));
                None
            }
        }
    }

    pub fn get_emulator(&self) -> &TerminalEmulator {
        &self.emulator
    }
}
