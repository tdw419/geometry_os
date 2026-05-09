; DESCRIPTION: Places a red circle of radius 11 at center (101, 22).
; PLAN: r0=101(x), r1=22(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 22
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
