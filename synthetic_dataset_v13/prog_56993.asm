; DESCRIPTION: Places a white circle of radius 79 at center (428, 105).
; PLAN: r0=428(x), r1=105(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 105
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
