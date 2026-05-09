; DESCRIPTION: Places a red circle of radius 75 at center (116, 101).
; PLAN: r0=116(x), r1=101(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 101
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
