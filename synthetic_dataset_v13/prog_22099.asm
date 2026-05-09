; DESCRIPTION: Sets a single yellow pixel at (170, 255).
; PLAN: r0=170(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
