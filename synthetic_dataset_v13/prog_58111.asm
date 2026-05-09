; DESCRIPTION: Sets a single orange pixel at (490, 53).
; PLAN: r0=490(x), r1=53(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 53
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
