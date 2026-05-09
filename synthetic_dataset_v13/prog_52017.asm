; DESCRIPTION: Draws a yellow circle centered at (111, 123) with radius 48.
; PLAN: r0=111(x), r1=123(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 123
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
