; DESCRIPTION: Draws a orange circle centered at (426, 32) with radius 12.
; PLAN: r0=426(x), r1=32(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 32
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
