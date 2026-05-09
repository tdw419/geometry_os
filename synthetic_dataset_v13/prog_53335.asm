; DESCRIPTION: Sets a single orange pixel at (193, 216).
; PLAN: r0=193(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
