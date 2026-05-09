; DESCRIPTION: Draws a orange circle centered at (375, 122) with radius 49.
; PLAN: r0=375(x), r1=122(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 122
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
