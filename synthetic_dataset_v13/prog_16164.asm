; DESCRIPTION: Sets a single black pixel at (22, 55).
; PLAN: r0=22(x), r1=55(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 55
LDI r2, 0x000000
PSET r0, r1, r2
HALT
