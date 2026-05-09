; DESCRIPTION: Places a red circle of radius 69 at center (99, 72).
; PLAN: r0=99(x), r1=72(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 72
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
