; DESCRIPTION: Draws a orange circle centered at (48, 58) with radius 38.
; PLAN: r0=48(x), r1=58(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 58
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
