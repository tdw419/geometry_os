; DESCRIPTION: Creates a black circular shape at (359, 151) with radius 30.
; PLAN: r0=359(x), r1=151(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 151
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
