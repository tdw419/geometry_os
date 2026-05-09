; DESCRIPTION: Places a red circle of radius 58 at center (73, 153).
; PLAN: r0=73(x), r1=153(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 153
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
