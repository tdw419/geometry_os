; DESCRIPTION: Draws a orange circle centered at (176, 226) with radius 30.
; PLAN: r0=176(x), r1=226(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 226
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
