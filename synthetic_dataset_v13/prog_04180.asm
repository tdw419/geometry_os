; DESCRIPTION: Sets a single white pixel at (215, 101).
; PLAN: r0=215(x), r1=101(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 101
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
