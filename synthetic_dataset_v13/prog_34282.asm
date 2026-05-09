; DESCRIPTION: Draws a yellow circle centered at (359, 102) with radius 76.
; PLAN: r0=359(x), r1=102(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 102
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
