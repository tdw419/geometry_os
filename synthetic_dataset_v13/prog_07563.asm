; DESCRIPTION: Sets a single orange pixel at (264, 7).
; PLAN: r0=264(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
