; DESCRIPTION: Places a white circle of radius 79 at center (139, 108).
; PLAN: r0=139(x), r1=108(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 108
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
