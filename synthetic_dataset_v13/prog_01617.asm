; DESCRIPTION: Draws a purple circle centered at (136, 133) with radius 77.
; PLAN: r0=136(x), r1=133(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 133
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
