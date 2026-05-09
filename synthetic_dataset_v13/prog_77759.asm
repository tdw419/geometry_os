; DESCRIPTION: Places a white circle of radius 60 at center (292, 115).
; PLAN: r0=292(x), r1=115(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 115
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
