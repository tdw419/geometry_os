; DESCRIPTION: Draws a yellow circle centered at (246, 170) with radius 64.
; PLAN: r0=246(x), r1=170(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 170
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
