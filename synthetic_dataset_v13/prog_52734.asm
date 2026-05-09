; DESCRIPTION: Creates a white circular shape at (370, 43) with radius 25.
; PLAN: r0=370(x), r1=43(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 43
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
