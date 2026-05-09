; DESCRIPTION: Places a yellow circle of radius 22 at center (223, 151).
; PLAN: r0=223(x), r1=151(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 151
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
