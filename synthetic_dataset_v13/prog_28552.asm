; DESCRIPTION: Draws a orange circle centered at (147, 96) with radius 76.
; PLAN: r0=147(x), r1=96(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 96
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
