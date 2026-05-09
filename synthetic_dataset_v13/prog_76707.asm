; DESCRIPTION: Draws a orange circle centered at (387, 148) with radius 59.
; PLAN: r0=387(x), r1=148(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 148
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
