; DESCRIPTION: Draws a orange circle centered at (59, 80) with radius 15.
; PLAN: r0=59(x), r1=80(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 80
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
