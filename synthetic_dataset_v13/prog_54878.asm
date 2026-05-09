; DESCRIPTION: Draws a orange circle centered at (397, 203) with radius 10.
; PLAN: r0=397(x), r1=203(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 203
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
