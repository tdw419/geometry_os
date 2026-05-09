; DESCRIPTION: Draws a orange circle centered at (261, 143) with radius 78.
; PLAN: r0=261(x), r1=143(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 143
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
