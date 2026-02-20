//! RISC-V Instrumentation Hooks
//!
//! Provides the infrastructure for real-time state tracking and ASCII scene generation.

use super::ExecutionState;
use futures_util::sink::SinkExt;
use serde_json::json;
use std::fs;
use std::path::PathBuf;
use std::sync::Arc;
use std::time::{SystemTime, UNIX_EPOCH};
use tokio::sync::Mutex;
use tokio_tungstenite::tungstenite::protocol::Message;

/// Instrumentation hook for the RISC-V executor
pub trait RiscvHook: Send + Sync {
    /// Called when the VM execution batch completes
    fn on_batch_complete(&self, pc: u32, state: &ExecutionState, cycles: u32);

    /// Called when new UART output is collected
    fn on_uart(&self, text: &str);

    /// Called when the VM halts
    fn on_halt(&self, exit_code: u32, cycles: u32);
}

/// A hook that generates ASCII representations of the VM state for AI perception
pub struct AsciiSceneHook {
    /// Base directory for .ascii files
    output_dir: PathBuf,
}

impl AsciiSceneHook {
    pub fn new(output_dir: PathBuf) -> Self {
        // Ensure directory exists
        if !output_dir.exists() {
            let _ = fs::create_dir_all(&output_dir);
        }

        Self { output_dir }
    }

    fn write_file(&self, filename: &str, content: &str) {
        let path = self.output_dir.join(filename);
        let _ = fs::write(path, content);
    }
}

impl RiscvHook for AsciiSceneHook {
    fn on_batch_complete(&self, pc: u32, state: &ExecutionState, cycles: u32) {
        let mut scene = String::new();
        scene.push_str("┌──────────────────────────────────────────────────────────┐\n");
        scene.push_str("│ RISC-V VM STATE (ASCII SCENE GRAPH)                      │\n");
        scene.push_str("├──────────────────────────────────────────────────────────┤\n");
        scene.push_str(&format!(
            "│ PC:         0x{:08x}                                 │\n",
            pc
        ));
        scene.push_str(&format!(
            "│ Privilege:  {}                                          │\n",
            privilege_to_str(state.privilege)
        ));
        scene.push_str(&format!(
            "│ Cycles:     {:<10}                                   │\n",
            cycles
        ));
        scene.push_str(&format!(
            "│ Status:     {:<10}                                   │\n",
            if state.running != 0 {
                "RUNNING"
            } else {
                "HALTED"
            }
        ));
        scene.push_str("├──────────────────────────────────────────────────────────┤\n");
        scene.push_str("│ REGISTERS (NEXT BATCH UPDATE)                            │\n");
        scene.push_str("└──────────────────────────────────────────────────────────┘\n");

        self.write_file("riscv_core.ascii", &scene);
    }

    fn on_uart(&self, text: &str) {
        if text.is_empty() {
            return;
        }

        let path = self.output_dir.join("riscv_uart.ascii");
        let mut current = fs::read_to_string(&path).unwrap_or_default();

        current.push_str(text);

        // Keep only last 24 lines (terminal size)
        let lines: Vec<&str> = current.lines().collect();
        let start = if lines.len() > 24 {
            lines.len() - 24
        } else {
            0
        };
        let kept = lines[start..].join("\n");

        let _ = fs::write(path, kept);
    }

    fn on_halt(&self, exit_code: u32, cycles: u32) {
        let mut scene = String::new();
        scene.push_str("╔══════════════════════════════════════════════════════════╗\n");
        scene.push_str("║ RISC-V VM HALTED                                         ║\n");
        scene.push_str("╠══════════════════════════════════════════════════════════╣\n");
        scene.push_str(&format!(
            "║ Exit Code:  {:<10}                                   ║\n",
            exit_code
        ));
        scene.push_str(&format!(
            "║ Total Cycles: {:<10}                                 ║\n",
            cycles
        ));
        scene.push_str("╚══════════════════════════════════════════════════════════╝\n");

        self.write_file("riscv_halt.ascii", &scene);
    }
}

/// A hook that streams VM state to the Visual Bridge over WebSocket
pub struct WebSocketHook {
    /// WebSocket sender (shared across threads)
    pub ws_sender: Arc<
        Mutex<
            Option<
                futures_util::stream::SplitSink<
                    tokio_tungstenite::WebSocketStream<
                        tokio_tungstenite::MaybeTlsStream<tokio::net::TcpStream>,
                    >,
                    Message,
                >,
            >,
        >,
    >,
}

impl WebSocketHook {
    pub fn new(
        ws_sender: Arc<
            Mutex<
                Option<
                    futures_util::stream::SplitSink<
                        tokio_tungstenite::WebSocketStream<
                            tokio_tungstenite::MaybeTlsStream<tokio::net::TcpStream>,
                        >,
                        Message,
                    >,
                >,
            >,
        >,
    ) -> Self {
        Self { ws_sender }
    }
}

impl RiscvHook for WebSocketHook {
    fn on_batch_complete(&self, pc: u32, state: &ExecutionState, cycles: u32) {
        let sender = self.ws_sender.clone();
        let state_copy = *state; // Copy the state since it's Pod + Copy
        tokio::spawn(async move {
            if let Some(tx) = sender.lock().await.as_mut() {
                let msg = json!({
                    "type": "riscv_state",
                    "pc": pc,
                    "cycles": cycles,
                    "running": state_copy.running != 0,
                    "privilege": state_copy.privilege,
                    "timestamp": chrono::Utc::now().timestamp_millis(),
                });
                let _ = tx.send(Message::Text(msg.to_string())).await;
            }
        });
    }

    fn on_uart(&self, text: &str) {
        if text.is_empty() {
            return;
        }
        let sender = self.ws_sender.clone();
        let text = text.to_string();
        tokio::spawn(async move {
            if let Some(tx) = sender.lock().await.as_mut() {
                let msg = json!({
                    "type": "riscv_uart",
                    "text": text,
                    "timestamp": chrono::Utc::now().timestamp_millis(),
                    "vm_id": "riscv-gpu-vm"
                });
                let _ = tx.send(Message::Text(msg.to_string())).await;
            }
        });
    }

    fn on_halt(&self, exit_code: u32, cycles: u32) {
        let sender = self.ws_sender.clone();
        tokio::spawn(async move {
            if let Some(tx) = sender.lock().await.as_mut() {
                let msg = json!({
                    "type": "riscv_halt",
                    "exit_code": exit_code,
                    "cycles": cycles,
                    "timestamp": chrono::Utc::now().timestamp_millis(),
                });
                let _ = tx.send(Message::Text(msg.to_string())).await;
            }
        });
    }
}

fn privilege_to_str(p: u32) -> &'static str {
    match p {
        0 => "User",
        1 => "Supervisor",
        3 => "Machine",
        _ => "Unknown",
    }
}

/// A hook that sends heat map updates based on RISC-V execution patterns
///
/// When the VM executes code, the PC (program counter) is converted to
/// heat map coordinates and sent to the Visual Bridge for visualization.
/// This provides a real-time view of which memory regions are being accessed.
pub struct HeatHook {
    /// WebSocket sender (shared across threads)
    pub ws_sender: Arc<
        Mutex<
            Option<
                futures_util::stream::SplitSink<
                    tokio_tungstenite::WebSocketStream<
                        tokio_tungstenite::MaybeTlsStream<tokio::net::TcpStream>,
                    >,
                    Message,
                >,
            >,
        >,
    >,
    /// Grid size for heat map (default: 64)
    pub grid_size: u32,
    /// Sample rate (send heat update every N batches)
    pub sample_rate: u32,
    /// Batch counter
    pub batch_count: std::sync::atomic::AtomicU32,
}

impl HeatHook {
    pub fn new(
        ws_sender: Arc<
            Mutex<
                Option<
                    futures_util::stream::SplitSink<
                        tokio_tungstenite::WebSocketStream<
                            tokio_tungstenite::MaybeTlsStream<tokio::net::TcpStream>,
                        >,
                        Message,
                    >,
                >,
            >,
        >,
    ) -> Self {
        Self {
            ws_sender,
            grid_size: 64,
            sample_rate: 10, // Send every 10 batches (reduces overhead)
            batch_count: std::sync::atomic::AtomicU32::new(0),
        }
    }

    /// Convert a memory address to heat map grid coordinates
    fn address_to_grid(&self, address: u32) -> (u32, u32) {
        // Each 4-byte word gets a unique position, wrapped to grid
        let word_addr = address / 4;
        let x = word_addr % self.grid_size;
        let y = (word_addr / self.grid_size) % self.grid_size;
        (x, y)
    }

    /// Send a heat access event to the Visual Bridge
    fn send_heat_access(&self, x: u32, y: u32, access_type: &str) {
        let sender = self.ws_sender.clone();
        let access_type = access_type.to_string();
        tokio::spawn(async move {
            if let Some(tx) = sender.lock().await.as_mut() {
                let timestamp = SystemTime::now()
                    .duration_since(UNIX_EPOCH)
                    .unwrap_or_default()
                    .as_millis();

                let msg = json!({
                    "type": "heat_access",
                    "x": x,
                    "y": y,
                    "access_type": access_type,
                    "source": "riscv",
                    "timestamp": timestamp,
                });
                let _ = tx.send(Message::Text(msg.to_string())).await;
            }
        });
    }
}

impl RiscvHook for HeatHook {
    fn on_batch_complete(&self, pc: u32, _state: &ExecutionState, _cycles: u32) {
        // Increment batch counter
        let count = self
            .batch_count
            .fetch_add(1, std::sync::atomic::Ordering::Relaxed);

        // Only send every N batches to reduce overhead
        if count % self.sample_rate != 0 {
            return;
        }

        // Convert PC to grid coordinates and send heat event
        let (x, y) = self.address_to_grid(pc);
        self.send_heat_access(x, y, "execute");

        // Also add some heat to nearby addresses to simulate code block execution
        // This creates a more realistic heat pattern
        for offset in &[4, 8, 12, 16] {
            let (nx, ny) = self.address_to_grid(pc + offset);
            if (nx, ny) != (x, y) {
                self.send_heat_access(nx, ny, "execute");
            }
        }
    }

    fn on_uart(&self, _text: &str) {
        // UART output doesn't generate heat in this implementation
    }

    fn on_halt(&self, _exit_code: u32, _cycles: u32) {
        // VM halt - could send a final heat summary if needed
    }
}

/// Simple broadcaster to multiple hooks
pub struct RiscvHookBroadcaster {
    pub hooks: Vec<Box<dyn RiscvHook>>,
}

impl RiscvHookBroadcaster {
    pub fn new() -> Self {
        Self { hooks: Vec::new() }
    }

    pub fn add_hook(&mut self, hook: Box<dyn RiscvHook>) {
        self.hooks.push(hook);
    }
}

impl RiscvHook for RiscvHookBroadcaster {
    fn on_batch_complete(&self, pc: u32, state: &ExecutionState, cycles: u32) {
        for hook in &self.hooks {
            hook.on_batch_complete(pc, state, cycles);
        }
    }

    fn on_uart(&self, text: &str) {
        for hook in &self.hooks {
            hook.on_uart(text);
        }
    }

    fn on_halt(&self, exit_code: u32, cycles: u32) {
        for hook in &self.hooks {
            hook.on_halt(exit_code, cycles);
        }
    }
}
