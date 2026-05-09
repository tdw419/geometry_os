; DESCRIPTION: Sets a single white pixel at (41, 102).
; PLAN: r0=41(x), r1=102(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 102
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
