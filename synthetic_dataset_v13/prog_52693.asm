; DESCRIPTION: Draws a blue circle centered at (241, 174) with radius 58.
; PLAN: r0=241(x), r1=174(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 174
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
