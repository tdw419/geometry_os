; DESCRIPTION: Places a white circle of radius 36 at center (349, 185).
; PLAN: r0=349(x), r1=185(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 185
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
