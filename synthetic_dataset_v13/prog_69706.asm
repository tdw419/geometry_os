; DESCRIPTION: Sets a single orange pixel at (341, 13).
; PLAN: r0=341(x), r1=13(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 13
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
