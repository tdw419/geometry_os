; DESCRIPTION: Draws a orange circle centered at (85, 208) with radius 28.
; PLAN: r0=85(x), r1=208(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 208
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
