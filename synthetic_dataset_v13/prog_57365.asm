; DESCRIPTION: Places a red circle of radius 65 at center (421, 88).
; PLAN: r0=421(x), r1=88(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 88
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
