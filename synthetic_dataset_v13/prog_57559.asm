; DESCRIPTION: Sets a single orange pixel at (48, 19).
; PLAN: r0=48(x), r1=19(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 19
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
