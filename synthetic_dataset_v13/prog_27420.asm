; DESCRIPTION: Draws a yellow circle centered at (274, 97) with radius 72.
; PLAN: r0=274(x), r1=97(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 97
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
