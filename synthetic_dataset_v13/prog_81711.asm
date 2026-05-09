; DESCRIPTION: Sets a single yellow pixel at (283, 123).
; PLAN: r0=283(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 283
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
