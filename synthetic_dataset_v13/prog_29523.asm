; DESCRIPTION: Creates a purple circular shape at (128, 84) with radius 78.
; PLAN: r0=128(x), r1=84(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 84
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
