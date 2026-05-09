; DESCRIPTION: Sets a single white pixel at (412, 214).
; PLAN: r0=412(x), r1=214(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 214
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
