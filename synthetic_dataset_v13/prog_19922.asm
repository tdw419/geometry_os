; DESCRIPTION: Places a white circle of radius 65 at center (314, 114).
; PLAN: r0=314(x), r1=114(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 114
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
