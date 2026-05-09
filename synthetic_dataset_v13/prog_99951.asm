; DESCRIPTION: Places a white circle of radius 40 at center (226, 152).
; PLAN: r0=226(x), r1=152(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 152
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
