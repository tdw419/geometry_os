; DESCRIPTION: Places a white circle of radius 35 at center (379, 186).
; PLAN: r0=379(x), r1=186(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 186
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
