; DESCRIPTION: Sets a single white pixel at (406, 86).
; PLAN: r0=406(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 406
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
