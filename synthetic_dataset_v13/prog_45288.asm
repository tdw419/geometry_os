; DESCRIPTION: Places a red circle of radius 43 at center (435, 130).
; PLAN: r0=435(x), r1=130(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 130
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
