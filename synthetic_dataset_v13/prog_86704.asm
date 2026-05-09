; DESCRIPTION: Sets a single orange pixel at (57, 183).
; PLAN: r0=57(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
