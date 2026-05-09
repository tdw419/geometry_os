; DESCRIPTION: Sets a single black pixel at (412, 182).
; PLAN: r0=412(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
HALT
