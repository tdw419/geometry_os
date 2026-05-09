; DESCRIPTION: Draws a orange circle centered at (90, 121) with radius 59.
; PLAN: r0=90(x), r1=121(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 121
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
