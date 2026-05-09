; DESCRIPTION: Places a blue circle of radius 37 at center (62, 167).
; PLAN: r0=62(x), r1=167(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 167
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
