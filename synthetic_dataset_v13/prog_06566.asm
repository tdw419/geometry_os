; DESCRIPTION: Draws a purple circle centered at (431, 74) with radius 60.
; PLAN: r0=431(x), r1=74(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 74
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
