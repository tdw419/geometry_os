; DESCRIPTION: Places a white circle of radius 60 at center (101, 171).
; PLAN: r0=101(x), r1=171(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 171
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
