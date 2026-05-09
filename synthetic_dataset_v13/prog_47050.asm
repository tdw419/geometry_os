; DESCRIPTION: Draws a purple circle centered at (323, 185) with radius 58.
; PLAN: r0=323(x), r1=185(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 185
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
