; DESCRIPTION: Draws a orange circle centered at (329, 143) with radius 58.
; PLAN: r0=329(x), r1=143(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 143
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
