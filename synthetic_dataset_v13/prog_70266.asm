; DESCRIPTION: Places a white circle of radius 29 at center (210, 54).
; PLAN: r0=210(x), r1=54(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 54
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
