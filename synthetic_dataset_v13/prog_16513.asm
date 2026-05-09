; DESCRIPTION: Draws a blue circle centered at (237, 97) with radius 70.
; PLAN: r0=237(x), r1=97(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 97
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
