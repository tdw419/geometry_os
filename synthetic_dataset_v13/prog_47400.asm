; DESCRIPTION: Draws a orange circle centered at (222, 171) with radius 80.
; PLAN: r0=222(x), r1=171(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 171
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
