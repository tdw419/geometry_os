; DESCRIPTION: Draws a orange circle centered at (67, 157) with radius 25.
; PLAN: r0=67(x), r1=157(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 157
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
