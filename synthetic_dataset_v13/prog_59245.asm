; DESCRIPTION: Sets a single blue pixel at (309, 201).
; PLAN: r0=309(x), r1=201(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 309
LDI r1, 201
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
