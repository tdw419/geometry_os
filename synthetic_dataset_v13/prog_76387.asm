; DESCRIPTION: Draws a orange circle centered at (74, 108) with radius 58.
; PLAN: r0=74(x), r1=108(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 108
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
