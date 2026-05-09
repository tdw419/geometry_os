; DESCRIPTION: Draws a purple circle centered at (226, 142) with radius 43.
; PLAN: r0=226(x), r1=142(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 142
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
