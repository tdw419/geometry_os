; DESCRIPTION: Sets a single orange pixel at (240, 85).
; PLAN: r0=240(x), r1=85(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 85
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
