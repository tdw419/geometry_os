; DESCRIPTION: Places a white circle of radius 65 at center (299, 80).
; PLAN: r0=299(x), r1=80(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 80
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
