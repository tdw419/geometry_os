; DESCRIPTION: Draws a yellow circle centered at (424, 114) with radius 30.
; PLAN: r0=424(x), r1=114(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 114
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
