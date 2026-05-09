; DESCRIPTION: Creates a blue circular shape at (457, 113) with radius 34.
; PLAN: r0=457(x), r1=113(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 113
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
