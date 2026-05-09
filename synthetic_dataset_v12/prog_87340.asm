; DESCRIPTION: Draws a orange circle centered at (61, 83) with radius 46.
; PLAN: r0=61(x), r1=83(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 83
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
