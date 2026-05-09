; DESCRIPTION: Draws a yellow circle centered at (258, 99) with radius 35.
; PLAN: r0=258(x), r1=99(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 99
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
