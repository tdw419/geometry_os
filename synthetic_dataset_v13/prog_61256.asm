; DESCRIPTION: Draws a orange circle centered at (272, 44) with radius 28.
; PLAN: r0=272(x), r1=44(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 44
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
