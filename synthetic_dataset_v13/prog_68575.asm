; DESCRIPTION: Draws a orange circle centered at (385, 164) with radius 44.
; PLAN: r0=385(x), r1=164(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 164
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
