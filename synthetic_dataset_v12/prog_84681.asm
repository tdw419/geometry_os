; DESCRIPTION: Creates a white circular shape at (91, 185) with radius 62.
; PLAN: r0=91(x), r1=185(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 185
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
