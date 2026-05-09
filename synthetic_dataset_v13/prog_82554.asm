; DESCRIPTION: Places a cyan circle of radius 69 at center (212, 151).
; PLAN: r0=212(x), r1=151(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 151
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
