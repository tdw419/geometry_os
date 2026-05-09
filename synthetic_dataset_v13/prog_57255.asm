; DESCRIPTION: Creates a green circular shape at (134, 113) with radius 22.
; PLAN: r0=134(x), r1=113(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 113
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
