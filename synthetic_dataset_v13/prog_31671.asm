; DESCRIPTION: Draws a yellow circle centered at (113, 174) with radius 75.
; PLAN: r0=113(x), r1=174(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 174
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
