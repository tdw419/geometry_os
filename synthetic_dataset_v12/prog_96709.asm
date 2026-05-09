; DESCRIPTION: Creates a blue circular shape at (390, 175) with radius 36.
; PLAN: r0=390(x), r1=175(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 175
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
