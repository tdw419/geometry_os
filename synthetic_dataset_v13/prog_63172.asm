; DESCRIPTION: Sets a single white pixel at (314, 192).
; PLAN: r0=314(x), r1=192(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 192
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
