; DESCRIPTION: Draws a orange circle centered at (105, 127) with radius 35.
; PLAN: r0=105(x), r1=127(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 127
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
