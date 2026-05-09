; DESCRIPTION: Draws a blue circle centered at (236, 135) with radius 36.
; PLAN: r0=236(x), r1=135(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 135
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
