; DESCRIPTION: Draws a purple circle centered at (375, 206) with radius 11.
; PLAN: r0=375(x), r1=206(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 206
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
