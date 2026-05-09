; DESCRIPTION: Draws a purple circle centered at (79, 153) with radius 56.
; PLAN: r0=79(x), r1=153(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 153
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
