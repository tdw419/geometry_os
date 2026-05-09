; DESCRIPTION: Creates a purple circular shape at (128, 117) with radius 22.
; PLAN: r0=128(x), r1=117(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 117
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
