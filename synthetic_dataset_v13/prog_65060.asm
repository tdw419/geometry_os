; DESCRIPTION: Sets a single cyan pixel at (327, 245).
; PLAN: r0=327(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 327
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
