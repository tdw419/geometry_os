; DESCRIPTION: Sets a single yellow pixel at (420, 54).
; PLAN: r0=420(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
