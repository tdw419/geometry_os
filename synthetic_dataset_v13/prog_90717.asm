; DESCRIPTION: Draws a blue circle centered at (103, 212) with radius 17.
; PLAN: r0=103(x), r1=212(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 212
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
