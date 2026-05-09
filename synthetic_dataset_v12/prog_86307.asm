; DESCRIPTION: Places a black circle of radius 31 at center (208, 151).
; PLAN: r0=208(x), r1=151(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 151
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
