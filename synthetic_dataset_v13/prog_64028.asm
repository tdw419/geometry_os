; DESCRIPTION: Creates a orange circular shape at (64, 184) with radius 40.
; PLAN: r0=64(x), r1=184(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 184
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
