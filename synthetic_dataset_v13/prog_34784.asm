; DESCRIPTION: Sets a single black pixel at (64, 205).
; PLAN: r0=64(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
HALT
