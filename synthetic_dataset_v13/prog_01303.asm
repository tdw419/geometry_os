; DESCRIPTION: Draws a orange circle centered at (415, 176) with radius 37.
; PLAN: r0=415(x), r1=176(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 176
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
