; DESCRIPTION: Places a red circle of radius 14 at center (137, 212).
; PLAN: r0=137(x), r1=212(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 212
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
