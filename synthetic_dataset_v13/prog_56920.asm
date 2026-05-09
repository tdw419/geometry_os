; DESCRIPTION: Creates a white circular shape at (416, 25) with radius 14.
; PLAN: r0=416(x), r1=25(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 25
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
