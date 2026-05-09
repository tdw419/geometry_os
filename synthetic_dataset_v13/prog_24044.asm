; DESCRIPTION: Places a orange circle of radius 71 at center (238, 137).
; PLAN: r0=238(x), r1=137(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 137
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
