; DESCRIPTION: Sets a single orange pixel at (222, 96).
; PLAN: r0=222(x), r1=96(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 96
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
