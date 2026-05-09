; DESCRIPTION: Creates a yellow circular shape at (172, 196) with radius 35.
; PLAN: r0=172(x), r1=196(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 196
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
