; DESCRIPTION: Places a white circle of radius 47 at center (410, 119).
; PLAN: r0=410(x), r1=119(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 119
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
