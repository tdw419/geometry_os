; DESCRIPTION: Draws a purple circle centered at (237, 65) with radius 41.
; PLAN: r0=237(x), r1=65(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 65
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
