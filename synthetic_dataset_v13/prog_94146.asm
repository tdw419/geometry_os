; DESCRIPTION: Places a blue circle of radius 12 at center (129, 232).
; PLAN: r0=129(x), r1=232(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 232
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
