; DESCRIPTION: Creates a yellow circular shape at (463, 191) with radius 28.
; PLAN: r0=463(x), r1=191(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 191
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
