; DESCRIPTION: Sets a single orange pixel at (35, 216).
; PLAN: r0=35(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
