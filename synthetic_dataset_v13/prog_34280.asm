; DESCRIPTION: Draws a purple circle centered at (198, 81) with radius 15.
; PLAN: r0=198(x), r1=81(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 81
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
