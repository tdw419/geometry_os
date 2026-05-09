; DESCRIPTION: Places a blue circle of radius 24 at center (58, 63).
; PLAN: r0=58(x), r1=63(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 63
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
