pub mod memory_bridge;
pub mod qmp;
#[cfg(test)]
mod qmp_tests;

pub use memory_bridge::SharedMemoryBridge;
pub use qmp::QmpClient;

#[derive(Debug, Clone)]
pub enum QmpCommand {
    Pause,
    Resume,
    Reset,
    QueryStatus,
}
