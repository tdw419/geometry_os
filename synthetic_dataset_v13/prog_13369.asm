; DESCRIPTION: Draws a orange circle centered at (58, 86) with radius 36.
; PLAN: r0=58(x), r1=86(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 86
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
