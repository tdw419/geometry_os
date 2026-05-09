; DESCRIPTION: Draws a black circle centered at (489, 81) with radius 21.
; PLAN: r0=489(x), r1=81(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 489
LDI r1, 81
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
