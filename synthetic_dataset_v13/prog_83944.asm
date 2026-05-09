; DESCRIPTION: Draws a blue circle centered at (195, 100) with radius 71.
; PLAN: r0=195(x), r1=100(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 100
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
