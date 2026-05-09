; DESCRIPTION: Draws a purple circle centered at (176, 47) with radius 37.
; PLAN: r0=176(x), r1=47(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 47
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
