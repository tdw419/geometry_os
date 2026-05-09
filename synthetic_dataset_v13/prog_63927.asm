; DESCRIPTION: Creates a orange circular shape at (256, 136) with radius 52.
; PLAN: r0=256(x), r1=136(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 136
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
