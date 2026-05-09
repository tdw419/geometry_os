; DESCRIPTION: Draws a orange circle centered at (206, 142) with radius 44.
; PLAN: r0=206(x), r1=142(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 142
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
