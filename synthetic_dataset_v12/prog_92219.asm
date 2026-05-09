; DESCRIPTION: Draws a orange circle centered at (355, 198) with radius 25.
; PLAN: r0=355(x), r1=198(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 198
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
