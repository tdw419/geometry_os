; DESCRIPTION: Places a black circle of radius 28 at center (344, 176).
; PLAN: r0=344(x), r1=176(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 176
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
