; DESCRIPTION: Draws a purple circle centered at (197, 75) with radius 29.
; PLAN: r0=197(x), r1=75(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 75
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
