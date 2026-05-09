; DESCRIPTION: Places a blue circle of radius 69 at center (84, 178).
; PLAN: r0=84(x), r1=178(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 178
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
