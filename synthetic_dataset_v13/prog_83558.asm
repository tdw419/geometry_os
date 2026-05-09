; DESCRIPTION: Draws a blue circle centered at (309, 99) with radius 56.
; PLAN: r0=309(x), r1=99(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 99
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
