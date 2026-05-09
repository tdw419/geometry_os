; DESCRIPTION: Sets a single white pixel at (156, 16).
; PLAN: r0=156(x), r1=16(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 16
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
