; DESCRIPTION: Draws a orange circle centered at (182, 97) with radius 10.
; PLAN: r0=182(x), r1=97(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 97
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
