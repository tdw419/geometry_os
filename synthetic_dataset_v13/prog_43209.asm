; DESCRIPTION: Creates a purple circular shape at (373, 128) with radius 70.
; PLAN: r0=373(x), r1=128(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 128
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
