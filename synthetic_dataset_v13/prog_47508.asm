; DESCRIPTION: Draws a orange circle centered at (59, 55) with radius 17.
; PLAN: r0=59(x), r1=55(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 55
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
