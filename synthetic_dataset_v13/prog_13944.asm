; DESCRIPTION: Places a purple circle of radius 27 at center (344, 94).
; PLAN: r0=344(x), r1=94(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 94
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
