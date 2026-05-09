; DESCRIPTION: Draws a purple circle centered at (37, 70) with radius 36.
; PLAN: r0=37(x), r1=70(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 70
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
