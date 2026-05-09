; DESCRIPTION: Places a red circle of radius 51 at center (310, 205).
; PLAN: r0=310(x), r1=205(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 205
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
