; DESCRIPTION: Draws a yellow circle centered at (288, 100) with radius 58.
; PLAN: r0=288(x), r1=100(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 100
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
