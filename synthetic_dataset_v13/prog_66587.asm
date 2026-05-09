; DESCRIPTION: Sets a single cyan pixel at (42, 164).
; PLAN: r0=42(x), r1=164(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 164
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
