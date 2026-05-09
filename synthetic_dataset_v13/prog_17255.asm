; DESCRIPTION: Draws a purple circle centered at (288, 170) with radius 50.
; PLAN: r0=288(x), r1=170(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 170
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
