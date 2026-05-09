; DESCRIPTION: Draws a orange circle centered at (216, 108) with radius 50.
; PLAN: r0=216(x), r1=108(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 108
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
