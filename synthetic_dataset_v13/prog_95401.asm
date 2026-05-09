; DESCRIPTION: Places a white circle of radius 53 at center (174, 161).
; PLAN: r0=174(x), r1=161(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 161
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
