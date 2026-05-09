; DESCRIPTION: Draws a blue circle centered at (276, 204) with radius 47.
; PLAN: r0=276(x), r1=204(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 204
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
