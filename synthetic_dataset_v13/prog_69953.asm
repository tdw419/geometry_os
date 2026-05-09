; DESCRIPTION: Sets a single yellow pixel at (260, 81).
; PLAN: r0=260(x), r1=81(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 260
LDI r1, 81
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
