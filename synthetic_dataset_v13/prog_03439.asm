; DESCRIPTION: Sets a single yellow pixel at (465, 141).
; PLAN: r0=465(x), r1=141(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 141
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
