; DESCRIPTION: Draws a orange circle centered at (141, 143) with radius 63.
; PLAN: r0=141(x), r1=143(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 143
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
