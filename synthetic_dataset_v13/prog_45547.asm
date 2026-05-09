; DESCRIPTION: Draws a orange circle centered at (220, 79) with radius 25.
; PLAN: r0=220(x), r1=79(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 79
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
