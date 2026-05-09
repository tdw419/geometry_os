; DESCRIPTION: Draws a blue circle centered at (113, 222) with radius 21.
; PLAN: r0=113(x), r1=222(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 222
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
