; DESCRIPTION: Places a white circle of radius 47 at center (85, 161).
; PLAN: r0=85(x), r1=161(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 161
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
