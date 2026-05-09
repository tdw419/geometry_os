; DESCRIPTION: Draws a purple circle centered at (420, 212) with radius 36.
; PLAN: r0=420(x), r1=212(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 212
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
