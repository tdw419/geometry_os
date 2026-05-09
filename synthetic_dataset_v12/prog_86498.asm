; DESCRIPTION: Sets a single white pixel at (401, 197).
; PLAN: r0=401(x), r1=197(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 197
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
