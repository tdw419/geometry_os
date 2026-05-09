; DESCRIPTION: Places a white circle of radius 79 at center (380, 151).
; PLAN: r0=380(x), r1=151(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 151
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
