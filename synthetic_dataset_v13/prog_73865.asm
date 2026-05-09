; DESCRIPTION: Creates a white circular shape at (244, 132) with radius 36.
; PLAN: r0=244(x), r1=132(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 132
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
