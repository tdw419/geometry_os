; DESCRIPTION: Draws a orange circle centered at (403, 99) with radius 78.
; PLAN: r0=403(x), r1=99(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 99
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
