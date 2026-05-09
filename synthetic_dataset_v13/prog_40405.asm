; DESCRIPTION: Sets a single cyan pixel at (73, 226).
; PLAN: r0=73(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
