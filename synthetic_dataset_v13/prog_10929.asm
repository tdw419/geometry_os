; DESCRIPTION: Draws a orange circle centered at (77, 136) with radius 16.
; PLAN: r0=77(x), r1=136(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 136
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
