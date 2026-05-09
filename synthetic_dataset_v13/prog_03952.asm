; DESCRIPTION: Places a cyan circle of radius 70 at center (323, 151).
; PLAN: r0=323(x), r1=151(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 151
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
