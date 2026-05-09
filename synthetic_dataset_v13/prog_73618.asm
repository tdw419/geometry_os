; DESCRIPTION: Draws a purple circle centered at (428, 241) with radius 14.
; PLAN: r0=428(x), r1=241(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 241
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
