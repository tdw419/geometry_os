; DESCRIPTION: Draws a orange circle centered at (251, 151) with radius 38.
; PLAN: r0=251(x), r1=151(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 151
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
