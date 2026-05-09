; DESCRIPTION: Sets a single white pixel at (228, 9).
; PLAN: r0=228(x), r1=9(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 9
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
