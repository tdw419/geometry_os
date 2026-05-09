; DESCRIPTION: Draws a blue circle centered at (395, 138) with radius 29.
; PLAN: r0=395(x), r1=138(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 138
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
