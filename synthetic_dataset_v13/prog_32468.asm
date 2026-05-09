; DESCRIPTION: Places a yellow circle of radius 48 at center (279, 151).
; PLAN: r0=279(x), r1=151(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 151
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
