; DESCRIPTION: Draws a orange circle centered at (91, 92) with radius 38.
; PLAN: r0=91(x), r1=92(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 92
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
