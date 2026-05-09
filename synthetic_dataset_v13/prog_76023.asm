; DESCRIPTION: Draws a black circle centered at (422, 196) with radius 18.
; PLAN: r0=422(x), r1=196(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 196
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
