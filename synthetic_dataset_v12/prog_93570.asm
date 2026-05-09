; DESCRIPTION: Draws a purple circle centered at (69, 159) with radius 45.
; PLAN: r0=69(x), r1=159(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 159
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
