; DESCRIPTION: Draws a yellow circle centered at (335, 157) with radius 72.
; PLAN: r0=335(x), r1=157(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 157
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
