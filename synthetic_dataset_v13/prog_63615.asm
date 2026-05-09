; DESCRIPTION: Sets a single orange pixel at (355, 86).
; PLAN: r0=355(x), r1=86(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 355
LDI r1, 86
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
