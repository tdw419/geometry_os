; DESCRIPTION: Draws a purple circle centered at (250, 150) with radius 74.
; PLAN: r0=250(x), r1=150(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 150
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
