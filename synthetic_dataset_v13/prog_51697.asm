; DESCRIPTION: Creates a green circular shape at (285, 88) with radius 70.
; PLAN: r0=285(x), r1=88(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 88
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
