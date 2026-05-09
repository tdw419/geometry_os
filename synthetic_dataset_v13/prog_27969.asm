; DESCRIPTION: Draws a black circle centered at (396, 99) with radius 56.
; PLAN: r0=396(x), r1=99(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 99
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
