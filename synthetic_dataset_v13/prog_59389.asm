; DESCRIPTION: Draws a orange circle centered at (306, 95) with radius 36.
; PLAN: r0=306(x), r1=95(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 95
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
