; DESCRIPTION: Draws a purple circle centered at (118, 140) with radius 71.
; PLAN: r0=118(x), r1=140(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 140
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
