; DESCRIPTION: Draws a purple circle centered at (317, 101) with radius 25.
; PLAN: r0=317(x), r1=101(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 101
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
