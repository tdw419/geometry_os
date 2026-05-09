; DESCRIPTION: Creates a orange circular shape at (43, 30) with radius 17.
; PLAN: r0=43(x), r1=30(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 30
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
