; DESCRIPTION: Sets a single white pixel at (419, 215).
; PLAN: r0=419(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 215
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
