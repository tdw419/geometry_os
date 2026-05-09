; DESCRIPTION: Places a white circle of radius 71 at center (427, 135).
; PLAN: r0=427(x), r1=135(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 135
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
