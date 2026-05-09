; DESCRIPTION: Draws a orange circle centered at (217, 189) with radius 38.
; PLAN: r0=217(x), r1=189(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 189
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
