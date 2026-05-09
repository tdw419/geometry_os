; DESCRIPTION: Draws a purple circle centered at (120, 75) with radius 58.
; PLAN: r0=120(x), r1=75(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 75
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
