; DESCRIPTION: Sets a single white pixel at (300, 27).
; PLAN: r0=300(x), r1=27(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 300
LDI r1, 27
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
