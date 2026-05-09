; DESCRIPTION: Creates a purple circular shape at (448, 159) with radius 36.
; PLAN: r0=448(x), r1=159(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 159
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
