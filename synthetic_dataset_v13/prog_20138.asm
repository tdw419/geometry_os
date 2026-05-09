; DESCRIPTION: Places a red circle of radius 35 at center (134, 87).
; PLAN: r0=134(x), r1=87(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 87
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
