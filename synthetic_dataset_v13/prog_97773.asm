; DESCRIPTION: Places a blue circle of radius 43 at center (76, 104).
; PLAN: r0=76(x), r1=104(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 104
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
