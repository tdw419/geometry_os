; DESCRIPTION: Places a red circle of radius 73 at center (137, 172).
; PLAN: r0=137(x), r1=172(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 172
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
