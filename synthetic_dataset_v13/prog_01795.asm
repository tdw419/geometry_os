; DESCRIPTION: Sets a single orange pixel at (119, 47).
; PLAN: r0=119(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
