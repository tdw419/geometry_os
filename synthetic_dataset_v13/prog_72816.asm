; DESCRIPTION: Draws a black circle centered at (84, 46) with radius 22.
; PLAN: r0=84(x), r1=46(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 46
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
