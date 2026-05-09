; DESCRIPTION: Places a red circle of radius 15 at center (344, 34).
; PLAN: r0=344(x), r1=34(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 34
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
