; DESCRIPTION: Places a blue circle of radius 54 at center (59, 198).
; PLAN: r0=59(x), r1=198(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 198
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
