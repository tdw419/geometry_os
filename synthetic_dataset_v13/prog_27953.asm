; DESCRIPTION: Sets a single black pixel at (279, 201).
; PLAN: r0=279(x), r1=201(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 279
LDI r1, 201
LDI r2, 0x000000
PSET r0, r1, r2
HALT
