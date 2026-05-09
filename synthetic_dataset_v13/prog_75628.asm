; DESCRIPTION: Places a black circle of radius 14 at center (344, 177).
; PLAN: r0=344(x), r1=177(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 177
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
