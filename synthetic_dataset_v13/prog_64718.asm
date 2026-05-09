; DESCRIPTION: Creates a purple circular shape at (223, 32) with radius 22.
; PLAN: r0=223(x), r1=32(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 32
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
