; DESCRIPTION: Draws a orange circle centered at (383, 115) with radius 53.
; PLAN: r0=383(x), r1=115(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 115
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
