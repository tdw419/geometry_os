; DESCRIPTION: Sets a single white pixel at (269, 234).
; PLAN: r0=269(x), r1=234(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 234
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
