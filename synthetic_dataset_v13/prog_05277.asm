; DESCRIPTION: Draws a orange circle centered at (259, 196) with radius 35.
; PLAN: r0=259(x), r1=196(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 196
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
