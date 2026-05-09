; DESCRIPTION: Places a white circle of radius 59 at center (244, 138).
; PLAN: r0=244(x), r1=138(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 138
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
