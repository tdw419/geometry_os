; DESCRIPTION: Draws a orange circle centered at (259, 192) with radius 40.
; PLAN: r0=259(x), r1=192(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 192
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
