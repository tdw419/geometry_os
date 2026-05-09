; DESCRIPTION: Draws a yellow circle centered at (122, 160) with radius 59.
; PLAN: r0=122(x), r1=160(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 160
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
