; DESCRIPTION: Sets a single yellow pixel at (192, 142).
; PLAN: r0=192(x), r1=142(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 142
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
