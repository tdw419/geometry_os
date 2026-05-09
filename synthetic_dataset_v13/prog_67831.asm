; DESCRIPTION: Places a white circle of radius 47 at center (75, 84).
; PLAN: r0=75(x), r1=84(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 84
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
