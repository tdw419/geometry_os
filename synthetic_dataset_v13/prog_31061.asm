; DESCRIPTION: Draws a black circle centered at (108, 145) with radius 78.
; PLAN: r0=108(x), r1=145(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 145
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
