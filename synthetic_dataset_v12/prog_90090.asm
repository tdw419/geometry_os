; DESCRIPTION: Places a white circle of radius 30 at center (82, 77).
; PLAN: r0=82(x), r1=77(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 77
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
