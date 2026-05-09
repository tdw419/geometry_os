; DESCRIPTION: Draws a yellow circle centered at (189, 62) with radius 59.
; PLAN: r0=189(x), r1=62(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 62
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
