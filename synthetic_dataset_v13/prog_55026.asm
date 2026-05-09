; DESCRIPTION: Creates a orange circular shape at (331, 65) with radius 21.
; PLAN: r0=331(x), r1=65(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 65
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
