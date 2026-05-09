; DESCRIPTION: Sets a single white pixel at (154, 193).
; PLAN: r0=154(x), r1=193(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 193
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
