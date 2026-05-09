; DESCRIPTION: Sets a single white pixel at (67, 54).
; PLAN: r0=67(x), r1=54(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 54
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
