; DESCRIPTION: Creates a yellow circular shape at (114, 191) with radius 29.
; PLAN: r0=114(x), r1=191(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 191
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
