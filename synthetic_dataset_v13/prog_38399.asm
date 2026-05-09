; DESCRIPTION: Draws a purple circle centered at (273, 69) with radius 47.
; PLAN: r0=273(x), r1=69(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 69
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
