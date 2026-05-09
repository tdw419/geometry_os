; DESCRIPTION: Creates a yellow circular shape at (68, 196) with radius 37.
; PLAN: r0=68(x), r1=196(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 196
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
