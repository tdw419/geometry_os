; DESCRIPTION: Draws a orange circle centered at (370, 103) with radius 43.
; PLAN: r0=370(x), r1=103(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 103
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
