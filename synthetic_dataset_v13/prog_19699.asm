; DESCRIPTION: Sets a single yellow pixel at (395, 97).
; PLAN: r0=395(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
