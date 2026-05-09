; DESCRIPTION: Places a cyan dot at position (42, 96).
; PLAN: r0=42(x), r1=96(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 96
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
