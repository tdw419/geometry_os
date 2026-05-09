; DESCRIPTION: Sets a single orange pixel at (405, 251).
; PLAN: r0=405(x), r1=251(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 251
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
