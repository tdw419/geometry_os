; DESCRIPTION: Places a red circle of radius 69 at center (353, 123).
; PLAN: r0=353(x), r1=123(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 123
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
