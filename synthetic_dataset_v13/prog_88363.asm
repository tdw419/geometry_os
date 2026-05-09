; DESCRIPTION: Sets a single white pixel at (287, 163).
; PLAN: r0=287(x), r1=163(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 163
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
