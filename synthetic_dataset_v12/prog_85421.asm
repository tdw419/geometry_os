; DESCRIPTION: Sets a single orange pixel at (153, 14).
; PLAN: r0=153(x), r1=14(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 14
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
