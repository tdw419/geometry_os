; DESCRIPTION: Creates a blue circular shape at (287, 181) with radius 37.
; PLAN: r0=287(x), r1=181(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 181
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
