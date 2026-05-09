; DESCRIPTION: Draws a yellow circle centered at (163, 72) with radius 34.
; PLAN: r0=163(x), r1=72(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 72
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
