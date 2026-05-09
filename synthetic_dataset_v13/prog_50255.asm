; DESCRIPTION: Creates a white circular shape at (344, 22) with radius 20.
; PLAN: r0=344(x), r1=22(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 22
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
