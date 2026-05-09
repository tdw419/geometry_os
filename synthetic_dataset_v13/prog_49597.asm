; DESCRIPTION: Places a white circle of radius 70 at center (77, 131).
; PLAN: r0=77(x), r1=131(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 131
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
