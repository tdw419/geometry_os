; DESCRIPTION: Places a white circle of radius 24 at center (172, 133).
; PLAN: r0=172(x), r1=133(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 133
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
