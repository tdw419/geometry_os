; DESCRIPTION: Draws a orange circle centered at (383, 34) with radius 28.
; PLAN: r0=383(x), r1=34(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 34
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
