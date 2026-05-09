; DESCRIPTION: Draws a orange circle centered at (240, 162) with radius 75.
; PLAN: r0=240(x), r1=162(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 162
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
