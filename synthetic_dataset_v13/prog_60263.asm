; DESCRIPTION: Sets a single white pixel at (161, 95).
; PLAN: r0=161(x), r1=95(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 95
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
