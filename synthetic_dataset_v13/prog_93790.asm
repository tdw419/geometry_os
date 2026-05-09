; DESCRIPTION: Creates a white circular shape at (370, 151) with radius 35.
; PLAN: r0=370(x), r1=151(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 151
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
