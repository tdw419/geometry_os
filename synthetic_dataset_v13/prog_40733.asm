; DESCRIPTION: Places a purple circle of radius 64 at center (78, 187).
; PLAN: r0=78(x), r1=187(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 187
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
