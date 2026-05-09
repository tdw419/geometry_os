; DESCRIPTION: Sets a single white pixel at (329, 109).
; PLAN: r0=329(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 109
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
