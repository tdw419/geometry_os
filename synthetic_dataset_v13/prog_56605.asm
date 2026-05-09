; DESCRIPTION: Draws a yellow circle centered at (335, 76) with radius 72.
; PLAN: r0=335(x), r1=76(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 76
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
