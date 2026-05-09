; DESCRIPTION: Creates a yellow circular shape at (312, 128) with radius 52.
; PLAN: r0=312(x), r1=128(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 128
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
