; DESCRIPTION: Draws a orange circle centered at (231, 203) with radius 34.
; PLAN: r0=231(x), r1=203(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 203
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
