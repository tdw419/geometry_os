; DESCRIPTION: Places a white circle of radius 57 at center (300, 175).
; PLAN: r0=300(x), r1=175(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 175
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
