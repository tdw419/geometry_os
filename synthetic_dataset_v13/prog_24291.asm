; DESCRIPTION: Creates a purple circular shape at (428, 147) with radius 64.
; PLAN: r0=428(x), r1=147(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 147
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
