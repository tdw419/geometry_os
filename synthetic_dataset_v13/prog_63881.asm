; DESCRIPTION: Sets a single orange pixel at (276, 148).
; PLAN: r0=276(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 148
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
