; DESCRIPTION: Creates a white circular shape at (385, 136) with radius 23.
; PLAN: r0=385(x), r1=136(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 136
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
