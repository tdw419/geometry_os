; DESCRIPTION: Sets a single orange pixel at (484, 54).
; PLAN: r0=484(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
