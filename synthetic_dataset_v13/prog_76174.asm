; DESCRIPTION: Creates a orange circular shape at (400, 128) with radius 63.
; PLAN: r0=400(x), r1=128(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 128
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
