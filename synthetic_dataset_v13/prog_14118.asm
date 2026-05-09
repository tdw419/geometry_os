; DESCRIPTION: Places a white circle of radius 64 at center (188, 72).
; PLAN: r0=188(x), r1=72(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 72
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
