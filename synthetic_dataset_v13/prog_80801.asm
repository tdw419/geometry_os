; DESCRIPTION: Sets a single orange pixel at (353, 79).
; PLAN: r0=353(x), r1=79(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 79
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
