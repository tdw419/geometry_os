; DESCRIPTION: Sets a single yellow pixel at (357, 218).
; PLAN: r0=357(x), r1=218(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 357
LDI r1, 218
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
