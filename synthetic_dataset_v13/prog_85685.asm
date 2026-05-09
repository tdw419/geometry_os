; DESCRIPTION: Places a white circle of radius 11 at center (287, 48).
; PLAN: r0=287(x), r1=48(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 48
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
