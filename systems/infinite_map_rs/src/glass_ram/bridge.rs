use serde::{Deserialize, Serialize};
use tokio::net::UnixListener;
use tokio::sync::mpsc;
use std::path::Path;
use log::{info, error};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum VisualCommand {
    AllocTower {
        id: u64,
        hilbert_index: u64,
        height: f32,
        color: [f32; 4], // RGBA
    },
    SetColor {
        id: u64,
        color: [f32; 4],
    },
    Pulse {
        id: u64,
        intensity: f32,
        duration_ms: u64,
    },
    ClearAll,
    SynapticAction {
        command: crate::synapse::SynapticCommand,
    },
    TypeText {
        text: String,
    },
    MoveCamera {
        x: f32,
        y: f32,
    },
    ZoomCamera {
        zoom: f32,
    },
    MoveMouse {
        x: f32,
        y: f32,
    },
    MouseClick {
        button: u32, // 1=Left, 2=Right, 3=Middle
        down: bool,
    },
}

pub struct BridgeServer {
    socket_path: String,
    tx: mpsc::Sender<VisualCommand>,
}

impl BridgeServer {
    pub fn new(socket_path: &str, tx: mpsc::Sender<VisualCommand>) -> Self {
        Self {
            socket_path: socket_path.to_string(),
            tx,
        }
    }

    pub async fn run(&self) -> std::io::Result<()> {
        let path = Path::new(&self.socket_path);
        if path.exists() {
            if let Err(e) = std::fs::remove_file(path) {
                error!("Failed to remove existing socket file: {}", e);
            }
        }

        let listener = UnixListener::bind(path)?;
        info!("BridgeServer listening on {}", self.socket_path);

        loop {
            match listener.accept().await {
                Ok((stream, _addr)) => {
                    let tx = self.tx.clone();
                    tokio::spawn(async move {
                        handle_connection(stream, tx).await;
                    });
                }
                Err(e) => {
                    error!("Bridge accept error: {}", e);
                }
            }
        }
    }
}

async fn handle_connection(mut stream: tokio::net::UnixStream, tx: mpsc::Sender<VisualCommand>) {
    use tokio::io::{BufReader, AsyncBufReadExt};
    
    let mut reader = BufReader::new(stream);
    let mut line = String::new();
    
    loop {
        line.clear();
        match reader.read_line(&mut line).await {
            Ok(0) => return, // EOF
            Ok(_) => {
                if let Ok(cmd) = serde_json::from_str::<VisualCommand>(&line) {
                    if let Err(_) = tx.send(cmd).await {
                        break;
                    }
                } else {
                    error!("Failed to parse command: {}", line.trim());
                }
            }
            Err(_) => return,
        }
    }
}
