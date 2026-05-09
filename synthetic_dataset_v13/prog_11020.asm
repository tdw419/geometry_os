; DESCRIPTION: Places a white circle of radius 44 at center (231, 151).
; PLAN: r0=231(x), r1=151(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 151
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
