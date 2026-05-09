; DESCRIPTION: Places a white circle of radius 75 at center (390, 152).
; PLAN: r0=390(x), r1=152(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 152
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
