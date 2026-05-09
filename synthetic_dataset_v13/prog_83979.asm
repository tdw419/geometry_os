; DESCRIPTION: Draws a orange circle centered at (405, 95) with radius 43.
; PLAN: r0=405(x), r1=95(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 95
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
