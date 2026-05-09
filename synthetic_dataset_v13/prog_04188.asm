; DESCRIPTION: Places a white circle of radius 11 at center (344, 106).
; PLAN: r0=344(x), r1=106(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 106
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
