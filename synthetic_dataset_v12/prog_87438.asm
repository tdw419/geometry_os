; DESCRIPTION: Places a red circle of radius 51 at center (246, 130).
; PLAN: r0=246(x), r1=130(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 130
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
