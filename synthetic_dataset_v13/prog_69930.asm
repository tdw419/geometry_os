; DESCRIPTION: Sets a single white pixel at (340, 21).
; PLAN: r0=340(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
