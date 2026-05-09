; DESCRIPTION: Sets a single orange pixel at (359, 30).
; PLAN: r0=359(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
