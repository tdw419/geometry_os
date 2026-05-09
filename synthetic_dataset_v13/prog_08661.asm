; DESCRIPTION: Draws a blue circle centered at (199, 170) with radius 70.
; PLAN: r0=199(x), r1=170(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 170
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
