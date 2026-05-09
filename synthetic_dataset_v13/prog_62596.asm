; DESCRIPTION: Draws a purple circle centered at (430, 134) with radius 34.
; PLAN: r0=430(x), r1=134(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 134
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
