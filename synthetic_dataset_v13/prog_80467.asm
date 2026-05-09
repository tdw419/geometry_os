; DESCRIPTION: Draws a orange circle centered at (222, 66) with radius 16.
; PLAN: r0=222(x), r1=66(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 66
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
