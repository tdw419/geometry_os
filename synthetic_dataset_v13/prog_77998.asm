; DESCRIPTION: Places a red circle of radius 15 at center (112, 149).
; PLAN: r0=112(x), r1=149(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 149
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
