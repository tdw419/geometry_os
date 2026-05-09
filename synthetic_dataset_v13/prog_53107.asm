; DESCRIPTION: Draws a purple circle centered at (248, 162) with radius 72.
; PLAN: r0=248(x), r1=162(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 162
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
