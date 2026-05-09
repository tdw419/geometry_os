; DESCRIPTION: Creates a white circular shape at (359, 117) with radius 62.
; PLAN: r0=359(x), r1=117(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 117
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
