; DESCRIPTION: Draws a yellow circle centered at (302, 31) with radius 31.
; PLAN: r0=302(x), r1=31(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 31
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
