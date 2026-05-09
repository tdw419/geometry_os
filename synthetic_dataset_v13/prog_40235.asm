; DESCRIPTION: Draws a purple circle centered at (252, 133) with radius 71.
; PLAN: r0=252(x), r1=133(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 133
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
