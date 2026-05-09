; DESCRIPTION: Creates a white circular shape at (114, 232) with radius 23.
; PLAN: r0=114(x), r1=232(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 232
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
