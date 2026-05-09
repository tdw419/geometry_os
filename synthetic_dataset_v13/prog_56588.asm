; DESCRIPTION: Draws a purple circle centered at (458, 63) with radius 20.
; PLAN: r0=458(x), r1=63(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 63
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
