; DESCRIPTION: Creates a orange circular shape at (175, 155) with radius 63.
; PLAN: r0=175(x), r1=155(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 155
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
