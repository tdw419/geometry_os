; DESCRIPTION: Sets a single yellow pixel at (314, 126).
; PLAN: r0=314(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
