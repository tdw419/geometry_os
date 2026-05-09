; DESCRIPTION: Draws a orange circle centered at (383, 202) with radius 50.
; PLAN: r0=383(x), r1=202(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 202
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
