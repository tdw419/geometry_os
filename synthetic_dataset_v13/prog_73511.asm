; DESCRIPTION: Creates a blue circular shape at (254, 132) with radius 78.
; PLAN: r0=254(x), r1=132(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 132
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
