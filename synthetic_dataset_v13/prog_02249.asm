; DESCRIPTION: Sets a single yellow pixel at (256, 57).
; PLAN: r0=256(x), r1=57(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 57
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
