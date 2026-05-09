; DESCRIPTION: Draws a orange circle centered at (54, 162) with radius 21.
; PLAN: r0=54(x), r1=162(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 162
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
