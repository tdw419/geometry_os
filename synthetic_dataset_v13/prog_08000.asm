; DESCRIPTION: Draws a yellow circle centered at (108, 145) with radius 23.
; PLAN: r0=108(x), r1=145(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 145
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
