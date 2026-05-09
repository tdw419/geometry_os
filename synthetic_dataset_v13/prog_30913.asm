; DESCRIPTION: Draws a yellow circle centered at (265, 166) with radius 22.
; PLAN: r0=265(x), r1=166(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 166
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
