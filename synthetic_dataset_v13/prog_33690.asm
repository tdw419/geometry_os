; DESCRIPTION: Creates a orange circular shape at (219, 97) with radius 80.
; PLAN: r0=219(x), r1=97(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 97
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
