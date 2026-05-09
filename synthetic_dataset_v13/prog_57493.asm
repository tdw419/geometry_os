; DESCRIPTION: Places a red circle of radius 29 at center (115, 77).
; PLAN: r0=115(x), r1=77(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 77
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
