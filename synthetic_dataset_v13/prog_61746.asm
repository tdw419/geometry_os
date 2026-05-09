; DESCRIPTION: Places a white circle of radius 63 at center (238, 98).
; PLAN: r0=238(x), r1=98(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 98
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
