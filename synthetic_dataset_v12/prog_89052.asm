; DESCRIPTION: Draws a yellow circle centered at (244, 181) with radius 57.
; PLAN: r0=244(x), r1=181(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 181
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
