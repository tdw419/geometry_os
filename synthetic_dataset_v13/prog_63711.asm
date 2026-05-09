; DESCRIPTION: Draws a orange circle centered at (366, 44) with radius 36.
; PLAN: r0=366(x), r1=44(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 44
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
