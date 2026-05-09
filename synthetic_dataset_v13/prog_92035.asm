; DESCRIPTION: Sets a single white pixel at (265, 59).
; PLAN: r0=265(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
