; DESCRIPTION: Places a white circle of radius 75 at center (171, 129).
; PLAN: r0=171(x), r1=129(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 129
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
