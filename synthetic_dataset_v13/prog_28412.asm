; DESCRIPTION: Sets a single white pixel at (329, 28).
; PLAN: r0=329(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
