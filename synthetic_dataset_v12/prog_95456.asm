; DESCRIPTION: Places a red circle of radius 40 at center (130, 153).
; PLAN: r0=130(x), r1=153(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 153
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
