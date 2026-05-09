; DESCRIPTION: Draws a yellow circle centered at (472, 240) with radius 14.
; PLAN: r0=472(x), r1=240(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 240
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
