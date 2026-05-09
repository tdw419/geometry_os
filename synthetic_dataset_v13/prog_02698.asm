; DESCRIPTION: Draws a orange circle centered at (250, 143) with radius 49.
; PLAN: r0=250(x), r1=143(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 143
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
