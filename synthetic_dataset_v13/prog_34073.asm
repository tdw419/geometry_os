; DESCRIPTION: Places a white circle of radius 15 at center (491, 117).
; PLAN: r0=491(x), r1=117(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 491
LDI r1, 117
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
