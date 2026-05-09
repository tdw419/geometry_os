; DESCRIPTION: Sets a single orange pixel at (376, 157).
; PLAN: r0=376(x), r1=157(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 376
LDI r1, 157
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
