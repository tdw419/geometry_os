; DESCRIPTION: Places a blue circle of radius 24 at center (139, 48).
; PLAN: r0=139(x), r1=48(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 48
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
