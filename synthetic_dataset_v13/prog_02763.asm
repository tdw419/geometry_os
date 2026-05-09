; DESCRIPTION: Draws a orange circle centered at (310, 115) with radius 36.
; PLAN: r0=310(x), r1=115(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 115
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
