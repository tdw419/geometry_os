; DESCRIPTION: Places a red circle of radius 71 at center (181, 116).
; PLAN: r0=181(x), r1=116(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 116
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
