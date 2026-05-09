; DESCRIPTION: Creates a white circular shape at (344, 46) with radius 39.
; PLAN: r0=344(x), r1=46(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 46
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
