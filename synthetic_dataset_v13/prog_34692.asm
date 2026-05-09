; DESCRIPTION: Draws a orange circle centered at (192, 27) with radius 17.
; PLAN: r0=192(x), r1=27(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 27
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
