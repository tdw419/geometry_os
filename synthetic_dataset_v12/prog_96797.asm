; DESCRIPTION: Sets a single black pixel at (401, 1).
; PLAN: r0=401(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
HALT
