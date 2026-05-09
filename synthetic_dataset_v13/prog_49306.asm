; DESCRIPTION: Places a red circle of radius 60 at center (388, 169).
; PLAN: r0=388(x), r1=169(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 169
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
