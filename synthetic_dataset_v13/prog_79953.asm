; DESCRIPTION: Places a red circle of radius 78 at center (247, 158).
; PLAN: r0=247(x), r1=158(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 158
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
