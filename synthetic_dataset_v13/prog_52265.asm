; DESCRIPTION: Places a purple circle of radius 11 at center (84, 166).
; PLAN: r0=84(x), r1=166(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 166
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
