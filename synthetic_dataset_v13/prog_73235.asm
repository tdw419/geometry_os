; DESCRIPTION: Sets a single black pixel at (271, 121).
; PLAN: r0=271(x), r1=121(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 271
LDI r1, 121
LDI r2, 0x000000
PSET r0, r1, r2
HALT
