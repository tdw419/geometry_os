; DESCRIPTION: Draws a purple circle centered at (108, 87) with radius 54.
; PLAN: r0=108(x), r1=87(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 87
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
