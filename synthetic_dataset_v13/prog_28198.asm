; DESCRIPTION: Sets a single black pixel at (448, 255).
; PLAN: r0=448(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
HALT
