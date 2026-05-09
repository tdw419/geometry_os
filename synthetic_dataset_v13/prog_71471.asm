; DESCRIPTION: Sets a single cyan pixel at (73, 61).
; PLAN: r0=73(x), r1=61(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 61
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
