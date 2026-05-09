; DESCRIPTION: Places a white circle of radius 72 at center (247, 179).
; PLAN: r0=247(x), r1=179(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 179
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
