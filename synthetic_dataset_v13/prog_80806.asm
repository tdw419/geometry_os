; DESCRIPTION: Creates a yellow circular shape at (25, 29) with radius 13.
; PLAN: r0=25(x), r1=29(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 29
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
