; DESCRIPTION: Draws a purple circle centered at (355, 174) with radius 14.
; PLAN: r0=355(x), r1=174(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 174
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
