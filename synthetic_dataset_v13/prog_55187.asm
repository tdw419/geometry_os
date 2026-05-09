; DESCRIPTION: Draws a yellow circle centered at (313, 85) with radius 58.
; PLAN: r0=313(x), r1=85(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 85
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
