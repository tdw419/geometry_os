; DESCRIPTION: Draws a yellow circle centered at (353, 73) with radius 29.
; PLAN: r0=353(x), r1=73(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 73
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
