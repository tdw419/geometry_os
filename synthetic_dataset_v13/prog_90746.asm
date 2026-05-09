; DESCRIPTION: Sets a single orange pixel at (211, 90).
; PLAN: r0=211(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 90
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
