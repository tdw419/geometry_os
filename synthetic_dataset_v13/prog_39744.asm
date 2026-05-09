; DESCRIPTION: Places a blue circle of radius 13 at center (59, 203).
; PLAN: r0=59(x), r1=203(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 203
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
