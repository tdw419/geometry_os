; DESCRIPTION: Sets a single purple pixel at (448, 223).
; PLAN: r0=448(x), r1=223(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 223
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
