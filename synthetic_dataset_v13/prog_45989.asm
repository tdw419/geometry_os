; DESCRIPTION: Draws a orange circle centered at (359, 131) with radius 49.
; PLAN: r0=359(x), r1=131(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 131
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
