; DESCRIPTION: Creates a yellow circular shape at (163, 191) with radius 10.
; PLAN: r0=163(x), r1=191(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 191
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
