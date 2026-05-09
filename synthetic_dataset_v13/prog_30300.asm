; DESCRIPTION: Draws a yellow circle centered at (351, 59) with radius 47.
; PLAN: r0=351(x), r1=59(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 59
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
