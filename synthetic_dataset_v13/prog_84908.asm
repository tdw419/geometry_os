; DESCRIPTION: Places a white circle of radius 59 at center (453, 167).
; PLAN: r0=453(x), r1=167(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 167
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
