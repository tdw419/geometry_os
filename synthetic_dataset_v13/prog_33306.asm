; DESCRIPTION: Draws a yellow circle centered at (453, 111) with radius 22.
; PLAN: r0=453(x), r1=111(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 111
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
