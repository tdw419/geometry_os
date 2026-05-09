; DESCRIPTION: Sets a single white pixel at (460, 88).
; PLAN: r0=460(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 88
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
