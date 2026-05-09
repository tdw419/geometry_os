; DESCRIPTION: Sets a single green pixel at (485, 245).
; PLAN: r0=485(x), r1=245(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 245
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
