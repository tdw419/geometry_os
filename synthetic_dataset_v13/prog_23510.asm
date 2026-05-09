; DESCRIPTION: Creates a purple circular shape at (96, 26) with radius 21.
; PLAN: r0=96(x), r1=26(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 26
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
