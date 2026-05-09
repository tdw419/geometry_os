; DESCRIPTION: Places a red circle of radius 22 at center (324, 148).
; PLAN: r0=324(x), r1=148(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 148
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
