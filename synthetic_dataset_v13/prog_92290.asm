; DESCRIPTION: Creates a yellow circular shape at (406, 54) with radius 13.
; PLAN: r0=406(x), r1=54(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 54
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
