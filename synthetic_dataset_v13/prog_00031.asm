; DESCRIPTION: Draws a blue circle centered at (113, 149) with radius 54.
; PLAN: r0=113(x), r1=149(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 149
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
