; DESCRIPTION: Sets a single black pixel at (473, 115).
; PLAN: r0=473(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 115
LDI r2, 0x000000
PSET r0, r1, r2
HALT
