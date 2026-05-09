; DESCRIPTION: Draws a blue circle centered at (327, 135) with radius 75.
; PLAN: r0=327(x), r1=135(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 135
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
