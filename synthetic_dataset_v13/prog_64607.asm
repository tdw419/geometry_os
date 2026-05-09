; DESCRIPTION: Draws a purple circle centered at (420, 237) with radius 12.
; PLAN: r0=420(x), r1=237(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 237
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
