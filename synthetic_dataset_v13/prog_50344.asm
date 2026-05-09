; DESCRIPTION: Places a white circle of radius 21 at center (379, 200).
; PLAN: r0=379(x), r1=200(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 200
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
