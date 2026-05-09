; DESCRIPTION: Draws a orange circle centered at (144, 167) with radius 59.
; PLAN: r0=144(x), r1=167(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 167
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
