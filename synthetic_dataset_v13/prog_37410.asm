; DESCRIPTION: Draws a orange circle centered at (102, 157) with radius 14.
; PLAN: r0=102(x), r1=157(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 157
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
