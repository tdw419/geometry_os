; DESCRIPTION: Places a blue circle of radius 14 at center (117, 117).
; PLAN: r0=117(x), r1=117(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 117
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
