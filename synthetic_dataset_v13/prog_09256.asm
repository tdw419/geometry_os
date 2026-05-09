; DESCRIPTION: Sets a single orange pixel at (155, 226).
; PLAN: r0=155(x), r1=226(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 226
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
