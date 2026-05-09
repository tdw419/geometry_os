; DESCRIPTION: Draws a purple circle centered at (120, 158) with radius 52.
; PLAN: r0=120(x), r1=158(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 158
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
