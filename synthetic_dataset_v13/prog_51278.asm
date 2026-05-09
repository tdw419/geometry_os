; DESCRIPTION: Creates a white circular shape at (370, 100) with radius 46.
; PLAN: r0=370(x), r1=100(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 100
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
