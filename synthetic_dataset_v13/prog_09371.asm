; DESCRIPTION: Creates a blue circular shape at (191, 113) with radius 31.
; PLAN: r0=191(x), r1=113(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 113
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
