; DESCRIPTION: Sets a single yellow pixel at (264, 185).
; PLAN: r0=264(x), r1=185(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 185
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
