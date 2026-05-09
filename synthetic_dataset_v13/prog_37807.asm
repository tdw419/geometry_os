; DESCRIPTION: Places a white circle of radius 54 at center (134, 146).
; PLAN: r0=134(x), r1=146(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 146
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
