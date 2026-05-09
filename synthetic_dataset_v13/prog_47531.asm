; DESCRIPTION: Draws a purple circle centered at (339, 163) with radius 57.
; PLAN: r0=339(x), r1=163(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 163
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
