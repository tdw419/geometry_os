; DESCRIPTION: Places a white circle of radius 39 at center (407, 151).
; PLAN: r0=407(x), r1=151(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 151
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
