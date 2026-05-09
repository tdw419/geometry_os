; DESCRIPTION: Places a white circle of radius 43 at center (367, 175).
; PLAN: r0=367(x), r1=175(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 175
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
