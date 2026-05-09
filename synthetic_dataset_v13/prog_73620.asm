; DESCRIPTION: Creates a yellow circular shape at (422, 136) with radius 54.
; PLAN: r0=422(x), r1=136(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 136
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
