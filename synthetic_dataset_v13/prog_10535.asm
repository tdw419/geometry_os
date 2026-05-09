; DESCRIPTION: Places a white circle of radius 12 at center (262, 137).
; PLAN: r0=262(x), r1=137(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 137
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
