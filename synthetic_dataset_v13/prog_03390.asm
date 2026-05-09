; DESCRIPTION: Sets a single orange pixel at (248, 95).
; PLAN: r0=248(x), r1=95(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 95
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
