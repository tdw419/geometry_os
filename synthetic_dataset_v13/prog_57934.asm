; DESCRIPTION: Creates a yellow circular shape at (234, 96) with radius 62.
; PLAN: r0=234(x), r1=96(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 96
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
