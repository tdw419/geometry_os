; DESCRIPTION: Draws a orange circle centered at (110, 50) with radius 39.
; PLAN: r0=110(x), r1=50(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 50
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
