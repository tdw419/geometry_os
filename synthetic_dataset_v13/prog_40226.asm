; DESCRIPTION: Places a white circle of radius 58 at center (79, 123).
; PLAN: r0=79(x), r1=123(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 123
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
