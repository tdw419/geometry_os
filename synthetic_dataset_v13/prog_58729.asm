; DESCRIPTION: Draws a orange circle centered at (56, 205) with radius 39.
; PLAN: r0=56(x), r1=205(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 205
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
