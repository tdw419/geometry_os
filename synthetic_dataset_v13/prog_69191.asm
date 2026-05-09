; DESCRIPTION: Draws a blue circle centered at (296, 138) with radius 31.
; PLAN: r0=296(x), r1=138(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 138
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
