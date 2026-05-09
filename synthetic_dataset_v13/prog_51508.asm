; DESCRIPTION: Draws a orange circle centered at (296, 138) with radius 72.
; PLAN: r0=296(x), r1=138(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 138
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
