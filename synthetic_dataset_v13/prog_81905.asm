; DESCRIPTION: Creates a black circular shape at (403, 114) with radius 14.
; PLAN: r0=403(x), r1=114(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 114
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
