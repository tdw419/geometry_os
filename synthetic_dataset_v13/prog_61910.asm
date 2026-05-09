; DESCRIPTION: Sets a single white pixel at (0, 228).
; PLAN: r0=0(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
