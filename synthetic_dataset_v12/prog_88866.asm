; DESCRIPTION: Places a red circle of radius 30 at center (130, 73).
; PLAN: r0=130(x), r1=73(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 73
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
