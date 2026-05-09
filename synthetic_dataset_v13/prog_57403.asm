; DESCRIPTION: Draws a orange circle centered at (128, 101) with radius 62.
; PLAN: r0=128(x), r1=101(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 101
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
