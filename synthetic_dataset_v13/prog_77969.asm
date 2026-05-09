; DESCRIPTION: Sets a single green pixel at (481, 78).
; PLAN: r0=481(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
