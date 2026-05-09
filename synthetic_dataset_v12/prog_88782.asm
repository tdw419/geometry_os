; DESCRIPTION: Draws a blue circle centered at (174, 60) with radius 43.
; PLAN: r0=174(x), r1=60(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 60
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
