; DESCRIPTION: Places a red circle of radius 66 at center (139, 125).
; PLAN: r0=139(x), r1=125(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 125
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
