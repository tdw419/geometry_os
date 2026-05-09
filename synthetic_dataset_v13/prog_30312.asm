; DESCRIPTION: Places a blue circle of radius 59 at center (364, 163).
; PLAN: r0=364(x), r1=163(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 163
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
