; DESCRIPTION: Sets a single cyan pixel at (64, 8).
; PLAN: r0=64(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 8
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
