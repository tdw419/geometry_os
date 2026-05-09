; DESCRIPTION: Sets a single cyan pixel at (8, 183).
; PLAN: r0=8(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 183
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
