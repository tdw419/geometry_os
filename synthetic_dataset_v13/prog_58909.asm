; DESCRIPTION: Places a orange circle of radius 19 at center (314, 151).
; PLAN: r0=314(x), r1=151(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 151
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
