; DESCRIPTION: Sets a single white pixel at (10, 234).
; PLAN: r0=10(x), r1=234(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 234
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
