; DESCRIPTION: Draws a blue circle centered at (162, 122) with radius 80.
; PLAN: r0=162(x), r1=122(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 122
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
