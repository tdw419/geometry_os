; DESCRIPTION: Creates a black circular shape at (422, 149) with radius 22.
; PLAN: r0=422(x), r1=149(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 149
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
