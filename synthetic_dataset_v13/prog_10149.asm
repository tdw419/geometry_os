; DESCRIPTION: Sets a single orange pixel at (233, 60).
; PLAN: r0=233(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 60
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
