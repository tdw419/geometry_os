; DESCRIPTION: Creates a purple circular shape at (200, 97) with radius 28.
; PLAN: r0=200(x), r1=97(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 97
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
