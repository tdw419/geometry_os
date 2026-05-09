; DESCRIPTION: Places a white circle of radius 39 at center (72, 84).
; PLAN: r0=72(x), r1=84(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 84
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
