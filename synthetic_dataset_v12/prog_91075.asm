; DESCRIPTION: Sets a single white pixel at (190, 225).
; PLAN: r0=190(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
