; DESCRIPTION: Sets a single white pixel at (234, 181).
; PLAN: r0=234(x), r1=181(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 181
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
