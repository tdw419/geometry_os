; DESCRIPTION: Draws a blue circle centered at (447, 71) with radius 47.
; PLAN: r0=447(x), r1=71(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 71
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
