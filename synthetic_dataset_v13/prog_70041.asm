; DESCRIPTION: Sets a single cyan pixel at (18, 201).
; PLAN: r0=18(x), r1=201(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 201
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
