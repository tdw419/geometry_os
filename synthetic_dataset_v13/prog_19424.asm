; DESCRIPTION: Draws a purple circle centered at (61, 176) with radius 48.
; PLAN: r0=61(x), r1=176(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 176
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
