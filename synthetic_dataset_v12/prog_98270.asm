; DESCRIPTION: Draws a yellow circle centered at (431, 78) with radius 13.
; PLAN: r0=431(x), r1=78(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 78
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
