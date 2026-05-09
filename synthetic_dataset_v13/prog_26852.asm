; DESCRIPTION: Draws a orange circle centered at (196, 157) with radius 74.
; PLAN: r0=196(x), r1=157(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 157
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
