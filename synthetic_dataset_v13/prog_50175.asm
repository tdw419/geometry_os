; DESCRIPTION: Draws a yellow circle centered at (55, 183) with radius 55.
; PLAN: r0=55(x), r1=183(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 183
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
