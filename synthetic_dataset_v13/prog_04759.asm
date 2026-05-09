; DESCRIPTION: Draws a orange circle centered at (134, 185) with radius 42.
; PLAN: r0=134(x), r1=185(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 185
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
