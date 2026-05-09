; DESCRIPTION: Sets a single yellow pixel at (208, 40).
; PLAN: r0=208(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
