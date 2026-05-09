; DESCRIPTION: Creates a yellow circular shape at (101, 76) with radius 10.
; PLAN: r0=101(x), r1=76(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 76
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
