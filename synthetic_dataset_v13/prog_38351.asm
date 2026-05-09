; DESCRIPTION: Places a white circle of radius 71 at center (330, 139).
; PLAN: r0=330(x), r1=139(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 139
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
