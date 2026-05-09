; DESCRIPTION: Sets a single white pixel at (154, 192).
; PLAN: r0=154(x), r1=192(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 192
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
