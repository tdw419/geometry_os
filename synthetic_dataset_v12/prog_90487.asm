; DESCRIPTION: Draws a purple circle centered at (277, 68) with radius 14.
; PLAN: r0=277(x), r1=68(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 68
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
