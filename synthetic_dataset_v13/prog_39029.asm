; DESCRIPTION: Sets a single yellow pixel at (157, 222).
; PLAN: r0=157(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 157
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
