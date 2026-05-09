; DESCRIPTION: Creates a yellow circular shape at (84, 64) with radius 34.
; PLAN: r0=84(x), r1=64(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 64
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
