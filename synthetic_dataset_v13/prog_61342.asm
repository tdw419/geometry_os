; DESCRIPTION: Sets a single orange pixel at (334, 194).
; PLAN: r0=334(x), r1=194(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 194
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
