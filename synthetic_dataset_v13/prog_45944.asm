; DESCRIPTION: Sets a single white pixel at (206, 45).
; PLAN: r0=206(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
