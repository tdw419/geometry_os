; DESCRIPTION: Places a purple circle of radius 56 at center (344, 96).
; PLAN: r0=344(x), r1=96(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 96
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
