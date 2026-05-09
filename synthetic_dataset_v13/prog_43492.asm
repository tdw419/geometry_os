; DESCRIPTION: Draws a purple circle centered at (271, 79) with radius 55.
; PLAN: r0=271(x), r1=79(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 79
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
