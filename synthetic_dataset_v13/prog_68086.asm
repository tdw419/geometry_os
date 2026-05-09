; DESCRIPTION: Places a white circle of radius 17 at center (118, 40).
; PLAN: r0=118(x), r1=40(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 40
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
