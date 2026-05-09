; DESCRIPTION: Creates a orange circular shape at (163, 160) with radius 13.
; PLAN: r0=163(x), r1=160(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 160
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
