; DESCRIPTION: Sets a single green pixel at (448, 147).
; PLAN: r0=448(x), r1=147(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 147
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
