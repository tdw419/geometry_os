; DESCRIPTION: Sets a single orange pixel at (170, 201).
; PLAN: r0=170(x), r1=201(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 201
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
