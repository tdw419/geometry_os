; DESCRIPTION: Draws a yellow circle centered at (64, 170) with radius 13.
; PLAN: r0=64(x), r1=170(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 170
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
