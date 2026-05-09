; DESCRIPTION: Sets a single white pixel at (229, 167).
; PLAN: r0=229(x), r1=167(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 167
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
