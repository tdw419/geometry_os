; DESCRIPTION: Draws a orange circle centered at (47, 184) with radius 42.
; PLAN: r0=47(x), r1=184(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 184
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
