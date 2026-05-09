; DESCRIPTION: Sets a single white pixel at (337, 182).
; PLAN: r0=337(x), r1=182(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 337
LDI r1, 182
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
