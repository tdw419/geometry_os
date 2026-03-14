use std::fs::File;
use std::io::{BufRead, BufReader};
use std::path::Path;

#[derive(Debug, Clone)]
pub struct MemoryRegion {
    pub start: u64,
    pub end: u64,
    pub permissions: String,  // "rwxp"
    pub offset: u64,
    pub device: String,
    pub inode: u64,
    pub pathname: Option<String>,
}

pub fn parse_proc_maps(pid: u32) -> Result<Vec<MemoryRegion>, std::io::Error> {
    let path = Path::new("/proc").join(pid.to_string()).join("maps");
    let file = File::open(&path)?;
    let reader = BufReader::new(file);
    
    let mut regions = Vec::new();
    
    for line in reader.lines() {
        let line = line?;
        let parts: Vec<&str> = line.split_whitespace().collect();
        
        if parts.len() < 5 {
            continue;
        }
        
        let range: Vec<&str> = parts[0].split('-').collect();
        if range.len() != 2 {
             continue;
        }

        let start = u64::from_str_radix(range[0], 16).map_err(|e| std::io::Error::new(std::io::ErrorKind::InvalidData, e))?;
        let end = u64::from_str_radix(range[1], 16).map_err(|e| std::io::Error::new(std::io::ErrorKind::InvalidData, e))?;
        
        let offset = u64::from_str_radix(parts[2], 16).unwrap_or(0);
        let device = parts[3].to_string();
        let inode = parts[4].parse().unwrap_or(0);
        
        let pathname = if parts.len() > 5 {
             Some(parts[5..].join(" ")) // Handle spaces in path
        } else {
             None
        };
        
        let region = MemoryRegion {
            start,
            end,
            permissions: parts[1].to_string(),
            offset,
            device,
            inode,
            pathname,
        };
        
        regions.push(region);
    }
    
    Ok(regions)
}

pub fn filter_writable_regions(regions: &[MemoryRegion]) -> Vec<&MemoryRegion> {
    regions
        .iter()
        .filter(|r| r.permissions.contains('w'))
        .collect()
}
