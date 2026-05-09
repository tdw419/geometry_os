; DESCRIPTION: Sets a single orange pixel at (66, 77).
; PLAN: r0=66(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
