; DESCRIPTION: Sets a single white pixel at (469, 64).
; PLAN: r0=469(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 469
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
