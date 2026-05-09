; DESCRIPTION: Places a white circle of radius 33 at center (315, 143).
; PLAN: r0=315(x), r1=143(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 143
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
