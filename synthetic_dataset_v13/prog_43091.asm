; DESCRIPTION: Draws a purple circle centered at (207, 100) with radius 28.
; PLAN: r0=207(x), r1=100(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 100
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
