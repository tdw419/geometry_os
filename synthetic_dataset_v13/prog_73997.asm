; DESCRIPTION: Draws a blue circle centered at (276, 87) with radius 17.
; PLAN: r0=276(x), r1=87(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 87
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
