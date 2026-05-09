; DESCRIPTION: Draws a orange circle centered at (453, 173) with radius 43.
; PLAN: r0=453(x), r1=173(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 173
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
