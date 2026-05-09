; DESCRIPTION: Draws a yellow circle centered at (163, 133) with radius 33.
; PLAN: r0=163(x), r1=133(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 133
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
