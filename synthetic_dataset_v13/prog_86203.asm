; DESCRIPTION: Sets a single white pixel at (61, 252).
; PLAN: r0=61(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
