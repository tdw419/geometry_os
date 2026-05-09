; DESCRIPTION: Places a white circle of radius 59 at center (387, 119).
; PLAN: r0=387(x), r1=119(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 119
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
