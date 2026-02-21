// systems/infinite_map_rs/src/qemu/qmp.rs (New File)
// QEMU Monitor Protocol (QMP) Client
// Phase 36.2: Controlling the Guest via JSON-over-Unix-Socket

use tokio::net::UnixStream;
use tokio::io::{AsyncWriteExt, BufReader, AsyncBufReadExt};
use serde_json::{json, Value};
use thiserror::Error;
use std::time::Duration;

#[derive(Error, Debug)]
pub enum QmpError {
    #[error("IO Error: {0}")]
    Io(#[from] std::io::Error),
    #[error("JSON Error: {0}")]
    Json(#[from] serde_json::Error),
    #[error("QMP Protocol Error: {0}")]
    Protocol(String),
    #[error("Wait timeout")]
    Timeout,
}

pub struct QmpClient {
    stream: BufReader<UnixStream>,
    socket_path: String,
}

impl QmpClient {
    /// Connect to a QMP socket and perform the initial handshake
    pub async fn connect(vm_id: &str) -> Result<Self, QmpError> {
        let socket_path = format!("/tmp/qmp-{}.sock", vm_id);
        log::info!("🔌 QMP: Connecting to {}", socket_path);

        // Retry loop for connection (VM might be starting up)
        let mut attempts = 0;
        let stream = loop {
            match UnixStream::connect(&socket_path).await {
                Ok(s) => break s,
                Err(e) => {
                    attempts += 1;
                    if attempts > 5 {
                        return Err(QmpError::Io(e));
                    }
                    tokio::time::sleep(Duration::from_millis(500)).await;
                }
            }
        };

        let mut client = Self {
            stream: BufReader::new(stream),
            socket_path,
        };

        // QMP Handshake
        // 1. Read Greeting
        let greeting = client.read_message().await?;
        if greeting.get("QMP").is_none() {
            return Err(QmpError::Protocol("No QMP greeting received".to_string()));
        }
        log::debug!("🔌 QMP Greeting: {:?}", greeting);

        // 2. Enable Capabilities
        let response = client.execute("qmp_capabilities", None).await?;
        if response.get("return").is_none() {
             return Err(QmpError::Protocol(format!("Handshake failed: {:?}", response)));
        }

        log::info!("✅ QMP Handshake Complete for {}", vm_id);
        Ok(client)
    }

    /// Execute a QMP command
    pub async fn execute(&mut self, command: &str, arguments: Option<Value>) -> Result<Value, QmpError> {
        let mut cmd_obj = json!({
            "execute": command
        });

        if let Some(args) = arguments {
            cmd_obj["arguments"] = args;
        }

        let cmd_str = serde_json::to_string(&cmd_obj)?;
        self.stream.write_all(cmd_str.as_bytes()).await?;
        self.stream.write_all(b"\n").await?; // Newline is required
        self.stream.flush().await?;

        // Read response (skip events if necessary, but for now simple read)
        // Note: Real QMP is asynchronous; events can arrive at any time.
        // This is a simplified synchronous-over-async implementations.
        loop {
            let msg = self.read_message().await?;
            // If it's an event (has "event" key), log it and wait for "return"
            if msg.get("event").is_some() {
                log::debug!("🔔 QMP Event: {:?}", msg);
                continue;
            }
            return Ok(msg);
        }
    }

    /// Read a single JSON message line
    async fn read_message(&mut self) -> Result<Value, QmpError> {
        let mut line = String::new();
        self.stream.read_line(&mut line).await?;
        if line.is_empty() {
             return Err(QmpError::Io(std::io::Error::new(std::io::ErrorKind::UnexpectedEof, "QMP Socket closed")));
        }
        let value: Value = serde_json::from_str(&line)?;
        Ok(value)
    }

    // -- High Level Commands --

    pub async fn query_status(&mut self) -> Result<String, QmpError> {
        let resp = self.execute("query-status", None).await?;
        // Expect: {"return": {"status": "running", "singlestep": false, "running": true}}
        if let Some(ret) = resp.get("return") {
            if let Some(status) = ret.get("status") {
                return Ok(status.as_str().unwrap_or("unknown").to_string());
            }
        }
        Err(QmpError::Protocol("Invalid query-status response".to_string()))
    }

    pub async fn stop(&mut self) -> Result<(), QmpError> {
        self.execute("stop", None).await?;
        Ok(())
    }

    pub async fn resume(&mut self) -> Result<(), QmpError> {
        self.execute("cont", None).await?;
        Ok(())
    }

    pub async fn system_reset(&mut self) -> Result<(), QmpError> {
        self.execute("system_reset", None).await?;
        Ok(())
    }
}
