; DESCRIPTION: Places a white circle of radius 78 at center (92, 156).
; PLAN: r0=92(x), r1=156(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 156
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
