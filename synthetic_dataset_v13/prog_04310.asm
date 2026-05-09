; DESCRIPTION: Places a white circle of radius 67 at center (193, 67).
; PLAN: r0=193(x), r1=67(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 67
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
