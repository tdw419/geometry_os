; DESCRIPTION: Sets a single white pixel at (256, 6).
; PLAN: r0=256(x), r1=6(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 6
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
