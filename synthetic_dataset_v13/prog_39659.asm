; DESCRIPTION: Places a black circle of radius 70 at center (393, 151).
; PLAN: r0=393(x), r1=151(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 151
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
