; DESCRIPTION: Places a white circle of radius 56 at center (353, 67).
; PLAN: r0=353(x), r1=67(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 67
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
