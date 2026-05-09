; DESCRIPTION: Draws a orange circle centered at (425, 144) with radius 14.
; PLAN: r0=425(x), r1=144(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 144
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
