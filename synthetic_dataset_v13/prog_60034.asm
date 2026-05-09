; DESCRIPTION: Creates a purple circular shape at (133, 99) with radius 33.
; PLAN: r0=133(x), r1=99(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 99
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
