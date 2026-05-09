; DESCRIPTION: Places a blue circle of radius 28 at center (204, 94).
; PLAN: r0=204(x), r1=94(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 94
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
