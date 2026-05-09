; DESCRIPTION: Sets a single orange pixel at (98, 175).
; PLAN: r0=98(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
