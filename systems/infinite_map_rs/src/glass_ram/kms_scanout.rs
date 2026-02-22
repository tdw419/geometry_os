// systems/infinite_map_rs/src/glass_ram/kms_scanout.rs
//
// KMS Scanout - Stubs for Phase 33.2
// Phase 33.2: Zero-Copy Pipeline

use std::error::Error;
use std::fmt;

#[derive(Debug)]
pub enum KmsError {
    DeviceOpenFailed(String),
}

impl fmt::Display for KmsError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:?}", self)
    }
}

impl Error for KmsError {}

pub type Result<T> = std::result::Result<T, Box<dyn Error>>;

pub struct KmsScanout;

impl KmsScanout {
    pub fn new(_device_path: Option<&str>) -> Result<Self> {
        Ok(KmsScanout)
    }

    pub fn scanout_dmabuf(&mut self, _dmabuf_fd: i32, _width: u32, _height: u32) -> Result<()> {
        Ok(())
    }

    pub fn width(&self) -> u32 {
        1920
    }

    pub fn height(&self) -> u32 {
        1080
    }

    pub fn restore_mode(&mut self) -> Result<()> {
        Ok(())
    }
}
