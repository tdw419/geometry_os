; DESCRIPTION: Places a white circle of radius 17 at center (174, 92).
; PLAN: r0=174(x), r1=92(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 92
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
