; DESCRIPTION: Draws a yellow circle centered at (302, 58) with radius 48.
; PLAN: r0=302(x), r1=58(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 58
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
