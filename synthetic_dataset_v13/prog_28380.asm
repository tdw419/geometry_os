; DESCRIPTION: Places a white circle of radius 34 at center (293, 75).
; PLAN: r0=293(x), r1=75(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 75
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
