; DESCRIPTION: Draws a orange circle centered at (391, 53) with radius 29.
; PLAN: r0=391(x), r1=53(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 53
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
