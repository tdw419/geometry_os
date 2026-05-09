; DESCRIPTION: Creates a green circular shape at (422, 112) with radius 13.
; PLAN: r0=422(x), r1=112(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 112
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
