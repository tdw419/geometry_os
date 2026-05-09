; DESCRIPTION: Places a red circle of radius 78 at center (388, 88).
; PLAN: r0=388(x), r1=88(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 88
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
