; DESCRIPTION: Places a red circle of radius 68 at center (432, 116).
; PLAN: r0=432(x), r1=116(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 116
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
