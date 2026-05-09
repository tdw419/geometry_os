; DESCRIPTION: Places a black circle of radius 65 at center (344, 183).
; PLAN: r0=344(x), r1=183(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 183
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
