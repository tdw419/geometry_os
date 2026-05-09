; DESCRIPTION: Places a red circle of radius 24 at center (353, 151).
; PLAN: r0=353(x), r1=151(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 151
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
