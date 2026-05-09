; DESCRIPTION: Sets a single white pixel at (158, 42).
; PLAN: r0=158(x), r1=42(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 42
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
