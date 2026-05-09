; DESCRIPTION: Sets a single black pixel at (70, 249).
; PLAN: r0=70(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 249
LDI r2, 0x000000
PSET r0, r1, r2
HALT
