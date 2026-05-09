; DESCRIPTION: Places a blue circle of radius 80 at center (357, 151).
; PLAN: r0=357(x), r1=151(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 151
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
