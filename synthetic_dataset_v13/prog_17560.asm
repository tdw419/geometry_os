; DESCRIPTION: Places a red circle of radius 26 at center (445, 151).
; PLAN: r0=445(x), r1=151(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 151
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
