; DESCRIPTION: Draws a blue circle centered at (59, 218) with radius 17.
; PLAN: r0=59(x), r1=218(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 218
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
