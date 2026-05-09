; DESCRIPTION: Draws a orange circle centered at (299, 167) with radius 58.
; PLAN: r0=299(x), r1=167(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 167
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
