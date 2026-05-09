; DESCRIPTION: Draws a orange circle centered at (110, 120) with radius 23.
; PLAN: r0=110(x), r1=120(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 120
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
