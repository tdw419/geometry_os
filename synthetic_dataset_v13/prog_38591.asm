; DESCRIPTION: Sets a single yellow pixel at (229, 176).
; PLAN: r0=229(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
