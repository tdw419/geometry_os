; DESCRIPTION: Draws a blue circle centered at (323, 65) with radius 48.
; PLAN: r0=323(x), r1=65(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 65
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
