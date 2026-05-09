; DESCRIPTION: Places a white circle of radius 62 at center (386, 67).
; PLAN: r0=386(x), r1=67(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 67
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
