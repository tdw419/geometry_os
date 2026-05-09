; DESCRIPTION: Draws a purple circle centered at (45, 44) with radius 11.
; PLAN: r0=45(x), r1=44(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 44
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
