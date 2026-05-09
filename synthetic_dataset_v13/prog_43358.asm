; DESCRIPTION: Draws a purple circle centered at (255, 148) with radius 36.
; PLAN: r0=255(x), r1=148(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 148
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
