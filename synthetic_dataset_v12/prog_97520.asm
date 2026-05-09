; DESCRIPTION: Sets a single yellow pixel at (463, 205).
; PLAN: r0=463(x), r1=205(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 205
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
