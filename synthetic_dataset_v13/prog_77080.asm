; DESCRIPTION: Creates a yellow circular shape at (288, 66) with radius 13.
; PLAN: r0=288(x), r1=66(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 66
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
