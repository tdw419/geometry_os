; DESCRIPTION: Places a purple circle of radius 59 at center (203, 60).
; PLAN: r0=203(x), r1=60(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 60
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
