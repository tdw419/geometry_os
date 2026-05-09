; DESCRIPTION: Sets a single orange pixel at (160, 69).
; PLAN: r0=160(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 69
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
