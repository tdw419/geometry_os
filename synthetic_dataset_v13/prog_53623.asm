; DESCRIPTION: Places a red circle of radius 51 at center (137, 62).
; PLAN: r0=137(x), r1=62(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 62
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
