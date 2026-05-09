; DESCRIPTION: Draws a orange circle centered at (303, 174) with radius 31.
; PLAN: r0=303(x), r1=174(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 174
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
