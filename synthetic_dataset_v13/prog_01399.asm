; DESCRIPTION: Sets a single orange pixel at (312, 15).
; PLAN: r0=312(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 312
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
