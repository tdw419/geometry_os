; DESCRIPTION: Places a white circle of radius 29 at center (103, 52).
; PLAN: r0=103(x), r1=52(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 52
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
