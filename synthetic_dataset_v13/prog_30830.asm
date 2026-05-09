; DESCRIPTION: Draws a blue circle centered at (174, 101) with radius 47.
; PLAN: r0=174(x), r1=101(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 101
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
