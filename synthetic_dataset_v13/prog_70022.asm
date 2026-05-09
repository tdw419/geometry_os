; DESCRIPTION: Draws a purple circle centered at (129, 86) with radius 70.
; PLAN: r0=129(x), r1=86(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 86
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
