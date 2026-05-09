; DESCRIPTION: Sets a single white pixel at (484, 208).
; PLAN: r0=484(x), r1=208(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 208
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
