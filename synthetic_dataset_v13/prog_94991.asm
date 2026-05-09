; DESCRIPTION: Creates a blue circular shape at (397, 99) with radius 54.
; PLAN: r0=397(x), r1=99(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 99
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
