; DESCRIPTION: Draws a orange circle centered at (397, 159) with radius 59.
; PLAN: r0=397(x), r1=159(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 159
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
