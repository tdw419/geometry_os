; DESCRIPTION: Draws a blue circle centered at (225, 141) with radius 74.
; PLAN: r0=225(x), r1=141(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 141
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
