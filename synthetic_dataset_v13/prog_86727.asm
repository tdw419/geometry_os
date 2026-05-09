; DESCRIPTION: Draws a yellow circle centered at (373, 198) with radius 49.
; PLAN: r0=373(x), r1=198(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 198
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
