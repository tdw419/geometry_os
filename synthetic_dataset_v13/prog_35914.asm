; DESCRIPTION: Sets a single white pixel at (81, 214).
; PLAN: r0=81(x), r1=214(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 214
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
