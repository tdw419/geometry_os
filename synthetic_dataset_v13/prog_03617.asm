; DESCRIPTION: Places a white circle of radius 71 at center (188, 92).
; PLAN: r0=188(x), r1=92(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 92
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
