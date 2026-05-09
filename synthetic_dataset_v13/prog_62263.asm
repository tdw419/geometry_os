; DESCRIPTION: Draws a purple circle centered at (267, 91) with radius 20.
; PLAN: r0=267(x), r1=91(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 91
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
