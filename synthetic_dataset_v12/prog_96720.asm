; DESCRIPTION: Draws a yellow circle centered at (451, 36) with radius 14.
; PLAN: r0=451(x), r1=36(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 36
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
