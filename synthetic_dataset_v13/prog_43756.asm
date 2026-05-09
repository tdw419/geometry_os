; DESCRIPTION: Draws a blue circle centered at (203, 50) with radius 30.
; PLAN: r0=203(x), r1=50(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 50
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
