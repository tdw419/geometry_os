; DESCRIPTION: Places a red circle of radius 69 at center (99, 88).
; PLAN: r0=99(x), r1=88(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 88
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
